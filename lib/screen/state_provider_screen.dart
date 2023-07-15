import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_coding/layout/default_layout.dart';
import 'package:riverpod_coding/riverpod/state_provider.dart';

class StateProviderSceen extends ConsumerWidget {
  const StateProviderSceen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);
    Size size = MediaQuery.of(context).size;
    return DefaultLayout(
        title: "State Provider Screen",
        body: SizedBox(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                provider.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(numberProvider.notifier)
                        .update((state) => state + 1);
                  },
                  child: const Text("UP")),
              ElevatedButton(
                  onPressed: () {
                    ref.read(numberProvider.notifier).state =
                        ref.read(numberProvider.notifier).state - 1;
                  },
                  child: const Text("DOWN")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => _NextScreen()));
                  },
                  child: const Text("Next Screen")),
            ],
          ),
        ));
  }
}

class _NextScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);
    Size size = MediaQuery.of(context).size;
    return DefaultLayout(
        title: "State Provider Screen",
        body: SizedBox(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                provider.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(numberProvider.notifier)
                        .update((state) => state + 1);
                  },
                  child: const Text("UP"))
            ],
          ),
        ));
  }
}
