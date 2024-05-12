import 'package:flutter/material.dart';
import 'package:fullstack_dev_test/ui/widgets/widgets.dart';

class BodyLoadingData {
  BodyLoadingData({required this.title, this.subTitle, this.onPressed});
  final String title;
  final String? subTitle;
  final VoidCallback? onPressed;
}

class BodyLoadingDataWidget extends StatelessWidget {
  const BodyLoadingDataWidget({
    super.key,
    required bool isError,
    required bool isLoading,
    required String headerTitle,
    required String errorMessage,
    required List<BodyLoadingData> data,
    required void Function() onRetry,
    ScrollController? scrollController,
  })  : _data = data,
        _onRetry = onRetry,
        _isError = isError,
        _isLoading = isLoading,
        _headerTitle = headerTitle,
        _errorMessage = errorMessage,
        _scrollController = scrollController;

  final bool _isError;
  final bool _isLoading;
  final String _headerTitle;
  final String _errorMessage;
  final List<BodyLoadingData> _data;
  final void Function() _onRetry;
  final ScrollController? _scrollController;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarWidget(title: _headerTitle);
    if (_isLoading && _data.isEmpty) {
      return Scaffold(
        appBar: appBar,
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: appBar,
      body: _isError
          ? ErrorBodyWidget(
              onRetry: _onRetry,
              message: _errorMessage,
            )
          : ListItemsWidget(
              scrollController: _scrollController,
              items: _data
                  .map(
                    (data) => ListItemsData(
                      title: data.title,
                      subTitle: data.subTitle,
                      onPressed: data.onPressed,
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
