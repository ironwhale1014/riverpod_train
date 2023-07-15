import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_coding/layout/default_layout.dart';
import 'package:riverpod_coding/riverpod/code_gener_provider.dart';

import '../main.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(num1: 10, num2: 20));

    logger.d("build");
    return DefaultLayout(
        title: "Code Generation Screen",
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("sate1: ${state1.toString()}"),
              state2.when(
                  data: (data) => Text("state2: ${data.toString()}"),
                  error: (err, stack) => Text(err.toString()),
                  loading: () => const CircularProgressIndicator()),
              state3.when(
                  data: (data) => Text("state3: ${data.toString()}"),
                  error: (err, stack) => Text(err.toString()),
                  loading: () => const CircularProgressIndicator()),
              Text("state4: ${state4.toString()}"),
              Consumer(
                  child: Text(" hello"),
                  builder: (context, ref, child) {
                    logger.d("Consumer");
                    final state5 = ref.watch(gStateNotifierProvider);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("State5 :${state5.toString()}"),
                        if (child != null) child
                      ],
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _StateFiveWidget(),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(gStateNotifierProvider.notifier).increment();
                      },
                      child: const Text("UP")),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(gStateNotifierProvider.notifier).decrement();
                      },
                      child: const Text("Down")),
                ],
              ),
              //초기화
              ElevatedButton(
                  onPressed: () {
                    ref.invalidate(gStateNotifierProvider);
                  },
                  child: Text("Invalidate"))
            ],
          ),
        ));
  }
}

// 부분적으로 빌드가 되면 새롭게 위젯을 만들어야 했다 근데 컨슈머 위젯을 쓰면 간단하게 할수 있음
class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state5 = ref.watch(gStateNotifierProvider);
    return Text("State5: ${state5.toString()}");
  }
}
