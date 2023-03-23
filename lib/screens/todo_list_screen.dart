// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_riverpod_todo_sample/models/todo.dart';
import 'package:flutter_riverpod_todo_sample/providers/todo_provider.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Consumer(builder: (context, ref, _) {
        final todoListAsyncValue = ref.watch(todoListFutureProvider);
        return todoListAsyncValue.map(
          data: (AsyncValue<List<Todo>> todos) => ListView.builder(
            itemCount: todos.value!.length,
            itemBuilder: (context, index) {
              final todo = todos.value![index];
              return ListTile(
                title: Text(todo.title),
                trailing: Icon(
                  todo.completed ? Icons.check : Icons.error,
                  color: todo.completed ? Colors.green : Colors.red,
                ),
              );
            },
          ),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          error: (error) => Center(child: Text(error.error.toString())),
        );
      }),
    );
  }
}
