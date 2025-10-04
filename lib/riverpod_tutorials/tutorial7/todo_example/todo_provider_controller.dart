import 'package:examples/riverpod_tutorials/tutorial7/todo_example/todo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier(List.empty());
});

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier(super.state);

  void add(String title) {
    final newTodo = Todo(
        id: state.isEmpty ? 0 : state.last.id + 1,
        title: title,
        completed: false);
    state = [...state, newTodo];
  }

  void remove(int id) {
    state = state.where((element) => element.id !=id).toList();
  }

  void toggle(int id) {
    final todos = [...state];
    final index = todos.indexWhere((element) => element.id == id);

    if(index == -1) return;

    final todo = todos[index];
    todos[index] = todo.copyWith(completed: !todo.completed);
    state = todos;
  }
}
