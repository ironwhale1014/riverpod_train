import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_coding/layout/default_layout.dart';
import 'package:riverpod_coding/riverpod/select_provider.dart';

class SelectScreen extends ConsumerWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));
    ref.listen(selectProvider.select((value) => value.hasBought),
        (previous, next) {
      print("next: $next");
    });

    return DefaultLayout(
        title: "Select Screen",
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(state.name),
              // Text(state.isSpicy.toString()),
              // Text(state.hasBought.toString()),
              Text(state.toString()),
              ElevatedButton(
                  onPressed: () {
                    ref.read(selectProvider.notifier).toggleIsSpicy();
                  },
                  child: Text("Spicy toggle")),
              ElevatedButton(
                  onPressed: () {
                    ref.read(selectProvider.notifier).toggleHasBought();
                  },
                  child: Text("has bouht toggle")),
            ],
          ),
        ));
  }
}
