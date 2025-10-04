import 'package:examples/riverpod_tutorials/tutorial7/counter_example/counter_provider_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final ctrl = ref.read(counterProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text("Counter Notifier"),),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(onPressed: ctrl.increment, heroTag: 'inc',child: const Icon(Icons.add),),
          const SizedBox(width: 12,),
          FloatingActionButton(onPressed: ctrl.decrement, heroTag: 'dec',child: const Icon(Icons.remove),),
          const SizedBox(width: 12,),
          FloatingActionButton(onPressed: ctrl.reset, heroTag: 'res',child: const Icon(Icons.refresh),),
        ],
      ),
      body: Center(
        child: Text("Count: $count"),
      ),
    );
  }
}