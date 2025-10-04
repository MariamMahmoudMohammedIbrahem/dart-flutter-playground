import 'dart:async';

import 'package:examples/riverpod_tutorials/tutorial5/api_provider_tutorial.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final greetingsAsyncProvider =
    AsyncNotifierProvider<GreetingsAsyncNotifier, String>(
        () => GreetingsAsyncNotifier());

class GreetingsAsyncNotifier extends AsyncNotifier<String> {
  @override
  Future<String> build() async {
    return await ref.read(fakeApiProvider).fetchGreetings();
  }

  Future<void> refreshGreetings() async {
    // either use this but in the real application we are mostly not getting the future calls
    // state = const AsyncValue.loading();
    // state = await AsyncValue.guard(() => ref.read(fakeApiProvider).fetchGreetings());
    // or this
    try {
      // if u want to save the data use
      // final oldData = state.value ?? '';
      state = const AsyncValue.loading();
      final value = await ref.read(fakeApiProvider).fetchGreetings();
      // either use this
      // state = AsyncData(value);
      // or this
      state = AsyncValue.data(value);
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }
}
