import 'package:flutter/material.dart';
import 'package:fullstack_dev_test/ui/widgets/widgets.dart';

class ListItemsData {
  ListItemsData({required this.title, this.subTitle, this.onPressed});

  final String title;
  final String? subTitle;
  final VoidCallback? onPressed;
}

class ListItemsWidget extends StatelessWidget {
  const ListItemsWidget({
    super.key,
    required List<ListItemsData> items,
    ScrollController? scrollController,
  })  : _items = items,
        _scrollController = scrollController;

  final List<ListItemsData> _items;
  final ScrollController? _scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _items.length,
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        height: 0,
        color: Colors.grey.shade200,
      ),
      itemBuilder: (context, index) {
        return ItemListWidget(
          title: _items[index].title,
          subTitle: _items[index].subTitle,
          onPressed: _items[index].onPressed,
        );
      },
    );
  }
}
