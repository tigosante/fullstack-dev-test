import 'package:flutter/material.dart';
import 'package:fullstack_dev_test/domain/domain.dart'
    show GetCityDeatilsUsecase, CityDetailsEntity;
import 'package:fullstack_dev_test/infra/infra.dart' show TranslateExtenion;
import 'package:fullstack_dev_test/ui/widgets/widgets.dart';

class CityDetailsPage extends StatefulWidget {
  const CityDetailsPage({
    super.key,
    required String cityName,
    required String countryname,
    required String subCountryname,
    required GetCityDeatilsUsecase getCityDeatilsUsecase,
  })  : _cityName = cityName,
        _countryname = countryname,
        _subCountryname = subCountryname,
        _getCityDeatilsUsecase = getCityDeatilsUsecase;

  final String _cityName;
  final String _countryname;
  final String _subCountryname;
  final GetCityDeatilsUsecase _getCityDeatilsUsecase;

  @override
  State<CityDetailsPage> createState() => _CityDetailsPageState();
}

class _CityDetailsPageState extends State<CityDetailsPage> {
  bool _isError = false;
  bool _isLoading = false;
  String _errorMessage = '';
  late CityDetailsEntity _cityDetails;

  @override
  void initState() {
    super.initState();
    _getDeatils();
  }

  Future<void> _getDeatils() async {
    if (_isLoading) {
      return;
    }
    setState(() => _isLoading = true);
    final either = await widget._getCityDeatilsUsecase(
      city: widget._cityName,
      country: widget._countryname,
      subCountry: widget._subCountryname,
    );
    if (either.isLeft) {
      return setState(() {
        _isError = true;
        _isLoading = false;
        _errorMessage = either.left.code;
      });
    }
    setState(() {
      _isError = false;
      _isLoading = false;
      _errorMessage = '';
      _cityDetails = either.right;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarWidget(title: widget._cityName);
    if (_isError) {
      return Scaffold(
        appBar: appBar,
        body: ErrorBodyWidget(
          onRetry: _getDeatils,
          message: _errorMessage.translate(),
        ),
      );
    }
    if (_isLoading) {
      return Scaffold(
        appBar: appBar,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: _cityDetails.title,
              styleFunction: (textTheme) =>
                  textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 24),
            if (_cityDetails.topics.isEmpty)
              ErrorBodyWidget(
                onRetry: _getDeatils,
                message: 'topics_not_found'.translate(),
              )
            else
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _cityDetails.topics
                    .map(
                      (data) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: TopicWidget(
                          title: data.title,
                          description: data.description,
                        ),
                      ),
                    )
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}
