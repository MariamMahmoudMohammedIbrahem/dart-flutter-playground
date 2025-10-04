import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateProviderTutorial extends ConsumerWidget {
  const StateProviderTutorial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("building");
    return Scaffold(
      appBar: AppBar(title: const Text('Counter with consumer'),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state ++;
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              print("consumering");
              final counter = ref.watch(counterProvider);
              return Text(counter.toString());
            },
        ),
      ),
    );
  }
}

final counterProvider = StateProvider((Ref ref) {
  return 0;
});
