import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textProvider = StateProvider((ref) => '');

class StatefulProviderTutorial extends ConsumerStatefulWidget {
  const StatefulProviderTutorial({super.key});

  @override
  ConsumerState<StatefulProviderTutorial> createState() => _StatefulProviderTutorialState();
}

class _StatefulProviderTutorialState extends ConsumerState<StatefulProviderTutorial> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      ref.read(textProvider.notifier).state = _controller.text;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final text = ref.watch(textProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Text Form'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
            ),
            const SizedBox(height: 20,),
            Text("You Typed: $text"),
          ],
        ),
      ),
    );
  }
}
