import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_coding/layout/default_layout.dart';
import 'package:riverpod_coding/model/shopping_item_model.dart';
import 'package:riverpod_coding/riverpod/notifier_provider.dart';

class NotifierScreen extends ConsumerWidget {
  const NotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvider);

    return DefaultLayout(
        title: "NotifierProvider",
        body: ListView(
          children: state
              .map((e) => CheckboxListTile(
                  title: Text(e.name),
                  value: e.hasBought,
                  onChanged: (value) {
                    ref
                        .read(shoppingListProvider.notifier)
                        .toggleHasBought(name: e.name);
                  }))
              .toList(),
        ));
  }
}
