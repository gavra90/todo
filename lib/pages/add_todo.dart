import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:todo/cubit/person/person_cubit.dart';
import 'package:todo/cubit/todo/todo_cubit.dart';
import 'package:todo/model/todo_item.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          int index = Random().nextInt(100);
          context.read<TodoCubit>().addItem(TodoItem(id: index, title: 'New title $index'));
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<PersonCubit>().changeName(
                      RandomNames(Zone.us).manName(),
                      RandomNames(Zone.us).surname(),
                    );
              },
              child: const Text('Change person name'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<PersonCubit>().changeAge(Random().nextInt(100));
              },
              child: const Text('Change persons age'),
            ),
          ),
        ],
      ),
    );
  }
}
