import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fullstack_dev_test/exceptions/exceptions.dart';

mixin FirestoreDataSource {
  Future<List<String>> getCountries({required int limit});
  Future<List<Map<String, dynamic>>> getCities({required String countryName});
}

class FirestoreDataSourceImpl implements FirestoreDataSource {
  FirestoreDataSourceImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  DocumentSnapshot? _lastCountry;

  CollectionReference<Map<String, dynamic>> get _countryRef =>
      _firestore.collection('countries');

  @override
  Future<List<String>> getCountries({required int limit}) async {
    var query = _countryRef.limit(limit);
    if (_lastCountry != null) {
      query = query.startAfterDocument(_lastCountry!);
    }

    late QuerySnapshot<Map<String, dynamic>> result;
    try {
      result = await query.get();
    } on Exception {
      throw DatasourceException(clientName: 'firestore');
    }
    if (result.docs.isEmpty) {
      throw NotFoundException(codeSuffix: 'country');
    }

    _lastCountry = result.docs.last;
    return result.docs.map((doc) => doc.id).toList()
      ..removeWhere((map) => map.isEmpty);
  }

  @override
  Future<List<Map<String, dynamic>>> getCities(
      {required String countryName}) async {
    return _countryRef.doc(countryName).get().then((values) {
      if (!values.exists) {
        throw NotFoundException(codeSuffix: 'cities');
      }

      return List.from(values.data()!['cities']).cast();
    });
  }
}
