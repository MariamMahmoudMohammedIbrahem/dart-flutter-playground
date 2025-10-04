import 'package:examples/riverpod_tutorials/tutorial4/animation_provider_tutorial.dart';
import 'package:examples/riverpod_tutorials/tutorial4/stateful_provider_tutorial.dart';
import 'package:examples/riverpod_tutorials/tutorial5/api_provider_tutorial.dart';
import 'package:examples/riverpod_tutorials/tutorial6/timer_screen.dart';
import 'package:examples/riverpod_tutorials/tutorial7/counter_example/counter_screen.dart';
import 'package:examples/riverpod_tutorials/tutorial7/todo_example/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp( const ProviderScope(child: MaterialApp( home: TodoScreen(),)));
}