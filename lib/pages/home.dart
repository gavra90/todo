import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/person/person_cubit.dart';
import 'package:todo/cubit/todo/todo_cubit.dart';
import 'package:todo/model/person.dart';
import 'package:todo/model/todo_item.dart';
import 'package:todo/pages/add_todo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Person person = context.watch<PersonCubit>().state;
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
        child: Column(
          children: [
            Wrap(children: [
              Text(person.fullName),
              const Text(' '),
              Text(person.age.toString()),
            ]),
            BlocBuilder<TodoCubit, List<TodoItem>>(
              builder: (context, state) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: state.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      key: ValueKey(state[index].id),
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
          ],
        ),
      ),
    );
  }
}
