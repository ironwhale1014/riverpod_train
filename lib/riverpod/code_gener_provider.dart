import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_gener_provider.g.dart';

//1) 어떤 프로바이더를 사용할지 결정 할 고민 할 필요가 없어짐 리버팟이 알아서 프로바이더 결정함

final _testProvider = Provider<String>((ref) => "hello Code Generation");

//기본은 autodispose
@riverpod
String gState(GStateRef ref) {
  return "hello Code Generation";
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(Duration(seconds: 3));
  return 10;
}

@Riverpod(keepAlive: true)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(Duration(seconds: 3));
  return 10;
}

//2) 파라미터 -> family 원래 한개만 입력 가능한데 일반 함수처럼 사용할 수 있도록

class Parameter {
  final int number1;
  final int number2;

  Parameter({required this.number1, required this.number2});
}

final _testFamilyProvider = Provider.family<int, Parameter>(
    (ref, parameter) => parameter.number1 * parameter.number2);

@riverpod
int gStateMultiply(GStateMultiplyRef ref,
    {required int num1, required int num2}) {
  return num1 * num2;
}

//State Notifier
@riverpod
class GStateNotifier extends _$GStateNotifier {
  @override
  int build() {
    return 0;
  }

  increment(){
    state++;
  }
  decrement(){
    state--;
  }
}
