import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/todo/todo_cubit.dart';
import 'package:todo/model/todo_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          int index = Random().nextInt(100);
          context.read<TodoCubit>().addItem(TodoItem(id: index, title: 'New title $index'));
        },
      ),
      body: SafeArea(
        child: BlocBuilder<TodoCubit, List<TodoItem>>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    color: Colors.amber,
                    child: Center(child: Text(state[index].title)),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
