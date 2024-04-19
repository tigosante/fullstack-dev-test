import 'package:flutter/material.dart';
import 'package:fullstack_dev_test/domain/domain.dart';
import 'package:fullstack_dev_test/infra/infra.dart' show TranslateExtenion;
import 'package:fullstack_dev_test/ui/pages/cities/cities_controller.dart';
import 'package:fullstack_dev_test/ui/widgets/widgets.dart';

class CitiesPage extends StatefulWidget {
  const CitiesPage({
    super.key,
    required String countryName,
    required CitiesController controller,
    required GetCitiesUsecase getCitiesUsecase,
  })  : _countryName = countryName,
        _controller = controller,
        _getCitiesUsecase = getCitiesUsecase;

  final String _countryName;
  final CitiesController _controller;
  final GetCitiesUsecase _getCitiesUsecase;

  @override
  State<CitiesPage> createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> {
  final _cities = <CityEntity>[];

  bool _isError = false;
  bool _isLoading = false;
  String _erroMessage = '';

  @override
  void initState() {
    super.initState();
    _getCities();
  }

  Future<void> _getCities() async {
    if (_isLoading) {
      return;
    }
    setState(() => _isLoading = true);
    final either =
        await widget._getCitiesUsecase(countryName: widget._countryName);
    if (either.isLeft) {
      return setState(() {
        _cities.clear();
        _isError = true;
        _isLoading = false;
        _erroMessage = either.left.code;
      });
    }
    setState(() {
      _erroMessage = '';
      _isError = false;
      _isLoading = false;
      _cities.addAll(either.right);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BodyLoadingDataWidget(
      isError: _isError,
      onRetry: _getCities,
      isLoading: _isLoading,
      headerTitle: widget._countryName,
      errorMessage: _erroMessage.translate(),
      data: _cities
          .map(
            (data) => BodyLoadingData(
              title: data.name,
              subTitle: data.subcountry,
              onPressed: () => widget._controller.nextPage(
                cityName: data.name,
                subcountry: data.subcountry,
              ),
            ),
          )
          .toList(),
    );
  }
}
