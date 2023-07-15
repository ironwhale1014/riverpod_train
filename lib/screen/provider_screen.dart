import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_coding/layout/default_layout.dart';
import 'package:riverpod_coding/riverpod/notifier_provider.dart';
import 'package:riverpod_coding/riverpod/provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(filteredShoppingListProvider);
    return DefaultLayout(
        title: "Provider Screen",
        actions: [
          PopupMenuButton<FilterState>(
            itemBuilder: (_) => FilterState.values
                .map((e) => PopupMenuItem(value: e, child: Text(e.name)))
                .toList(),
            onSelected: (value) {
              ref.read(filterProvider.notifier).update((state) => value);
            },
          )
        ],
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
