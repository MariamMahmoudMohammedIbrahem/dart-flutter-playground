import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'async_notifier.dart';

class AsyncGreetingsScreen extends ConsumerWidget {
  const AsyncGreetingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greetingsAsync = ref.watch(greetingsAsyncProvider);
    final greetingsAsyncNotifier = ref.read(greetingsAsyncProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Async Notifier Demo"),
      ),
      body: Center(
        child: greetingsAsync.when(
            skipLoadingOnRefresh: false,
            data: (data) => Text(data),
            error: (error, errorTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          greetingsAsyncNotifier.refreshGreetings();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
