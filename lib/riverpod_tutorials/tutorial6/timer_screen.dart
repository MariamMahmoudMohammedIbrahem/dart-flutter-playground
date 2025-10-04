import 'package:examples/riverpod_tutorials/tutorial6/fake_stream_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tickerProvider = StreamProvider((ref) {
  final service = ref.read(timerServiceProvider);
  return service.tickWithError();
});

class TimerScreen extends ConsumerWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickAsync = ref.watch(tickerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Timer"),
      ),
      body: Center(
        child: tickAsync.when(
          skipLoadingOnRefresh: false,
          data: (count) => Text(count.toString()),
          error: (error, errorTrace) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(error.toString()),
              const SizedBox(
                height: 12.0,
              ),
              ElevatedButton(
                onPressed: () => ref.refresh(tickerProvider),
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
