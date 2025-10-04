import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final durationProvider = Provider((ref) => const Duration(seconds: 2));

class AnimationProviderTutorial extends ConsumerStatefulWidget {
  const AnimationProviderTutorial({super.key});

  @override
  ConsumerState<AnimationProviderTutorial> createState() =>
      _AnimationProviderTutorialState();
}

class _AnimationProviderTutorialState
    extends ConsumerState<AnimationProviderTutorial>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    final duration = ref.read(durationProvider);
    _controller = AnimationController(vsync: this, duration: duration)
      ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation"),
      ),
      body: Center(
        child: ScaleTransition(
          scale: _controller.drive(Tween(begin: 0.5, end: 1.5)),
          child: const Icon(
            Icons.circle,
            size: 80,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
