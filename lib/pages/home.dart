import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/todo/todo_cubit.dart';
import 'package:todo/model/todo_item.dart';
import 'package:todo/pages/add_todo.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next_outlined),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTodoPage(),
            ),
          );
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Task'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_controller.text.trim().isNotEmpty) {
                    context.read<TodoCubit>().addItem(_controller.text);
                  }
                  _controller.text = '';
                },
                child: const Text('Add Task'),
              ),
              const SizedBox(height: 10),
              BlocBuilder<TodoCubit, List<TodoItem>>(
                builder: (context, state) {
                  if (state.isEmpty) {
                    return const Center(child: Text('Start adding todos'));
                  }
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state.length,
                    itemBuilder: (BuildContext context, int index) {
                      TodoItem item = state[index];
                      return Dismissible(
                        background: Container(
                          color: Colors.green,
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Icon(Icons.done_outlined),
                            ),
                          ),
                        ),
                        secondaryBackground: Container(
                          color: Colors.red,
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Icon(Icons.delete),
                            ),
                          ),
                        ),
                        confirmDismiss: (direction) async {
                          if (direction == DismissDirection.startToEnd) {
                            context.read<TodoCubit>().markDone(item);
                            return false;
                          }
                          context.read<TodoCubit>().remove(item);
                        },
                        key: ValueKey(index),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            color: item.done ? Colors.grey : Colors.lightBlue,
                            child: Center(child: Text(item.title)),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
