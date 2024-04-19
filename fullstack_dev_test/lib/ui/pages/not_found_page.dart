import 'package:flutter/material.dart';
import 'package:fullstack_dev_test/infra/infra.dart' show TranslateExtenion;
import 'package:fullstack_dev_test/router/router.dart'
    show AppRouter, AppRouterEnum;
import 'package:fullstack_dev_test/ui/widgets/widgets.dart'
    show AppBarWidget, PrimaryButtonWidget, TextWidget;

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({
    super.key,
    required AppRouter appRouter,
  }) : _appRouter = appRouter;

  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'page_not_found_title'.translate()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              text: 'page_not_found_message'.translate(),
              styleFunction: (textTheme) =>
                  textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            PrimaryButtonWidget(
              title: 'page_not_found_button'.translate(),
              onPressed: () => _appRouter.reaplce(AppRouterEnum.home),
            ),
          ],
        ),
      ),
    );
  }
}
