import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger1 extends ProviderObserver {

  // 프로바이더를 업데이트 했다.
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    print("[update] $previousValue, $newValue");
  }

  //프로바이더 추가 시
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {
    print("[add] $value");
  }

  @override
  void didDisposeProvider(ProviderBase<Object?> provider, ProviderContainer container) {
    print("didDisposeProvider");
  }
}
