import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_coding/layout/default_layout.dart';
import 'package:riverpod_coding/riverpod/auto_provider.dart';

class AutoDisposeScreen extends ConsumerWidget {
  const AutoDisposeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autoProvider);

    return DefaultLayout(
        title: "auto dispose",
        body: Center(
          child: state.when(
              data: (data) => Text(data.toString()),
              error: (err, stack) => Text(err.toString()),
              loading: () => const CircularProgressIndicator()),
        ));
  }
}
