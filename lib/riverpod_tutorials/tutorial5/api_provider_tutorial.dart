import 'package:examples/riverpod_tutorials/tutorial5/fake_api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fakeApiProvider = Provider((ref) => FakeService());

final greetingFutureProvider = FutureProvider((ref) async {
  final service = ref.read(fakeApiProvider);
  return await service.fetchGreetings();
});

class GreetingScreen extends ConsumerWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greetingsAsync = ref.watch(greetingFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Async Greetings"),
      ),
      body: Center(
        child: greetingsAsync.when(
          skipLoadingOnRefresh: false,
          data: (greetings) => Text(greetings),
          error: (error, errorTrace) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(error.toString()),
              const SizedBox(
                height: 12.0,
              ),
              ElevatedButton(
                onPressed: () => ref.refresh(greetingFutureProvider),
                child: const Text("Retry"),
              ),
            ],
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
