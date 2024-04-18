import 'package:flutter/material.dart';
import 'package:fullstack_dev_test/domain/domain.dart';
import 'package:fullstack_dev_test/extensions/extensions.dart';
import 'package:fullstack_dev_test/ui/pages/country/country_controller.dart';
import 'package:fullstack_dev_test/ui/widgets/widgets.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({
    super.key,
    required CountryController controller,
    required GetContriesUsecase getContriesUsecase,
  })  : _controller = controller,
        _getContriesUsecase = getContriesUsecase;

  final CountryController _controller;
  final GetContriesUsecase _getContriesUsecase;

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final _countries = <CountryEntity>[];
  final _scrollController = ScrollController();

  bool _isError = false;
  bool _isLoading = false;
  String _erroMessage = '';

  @override
  void initState() {
    super.initState();
    _getCountries();
    _scrollController.addListener(() {
      if (_scrollController.position.extentAfter < 300) {
        _getCountries();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Future<void> _getCountries() async {
    if (_isLoading) {
      return;
    }
    setState(() => _isLoading = true);
    final either = await widget._getContriesUsecase();
    if (either.isLeft) {
      return setState(() {
        _isError = true;
        _isLoading = false;
        _countries.clear();
        _erroMessage = either.left.code;
      });
    }
    setState(() {
      _isError = false;
      _isLoading = false;
      _erroMessage = '';
      _countries.addAll(either.right);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BodyLoadingDataWidget(
      isError: _isError,
      isLoading: _isLoading,
      onRetry: _getCountries,
      scrollController: _scrollController,
      headerTitle: 'countries'.translate(),
      errorMessage: _erroMessage.translate(),
      data: _countries
          .map(
            (data) => BodyLoadingData(
              title: data.name,
              onPressed: () => widget._controller.nextPage(data.name),
            ),
          )
          .toList(),
    );
  }
}
