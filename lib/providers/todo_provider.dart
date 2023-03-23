// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_riverpod_todo_sample/models/todo.dart';
import 'package:flutter_riverpod_todo_sample/repositories/todo_repository.dart';

final todoRepositoryProvider = Provider((ref) => TodoRepository());

final todoListFutureProvider = FutureProvider<List<Todo>>((ref) async {
  final todoRepository = ref.read(todoRepositoryProvider);
  return await todoRepository.fetchTodos();
});
