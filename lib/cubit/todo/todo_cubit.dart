import 'package:bloc/bloc.dart';
import 'package:todo/model/todo_item.dart';

class TodoCubit extends Cubit<List<TodoItem>> {
  TodoCubit() : super([]);

  void addItem(String title) {
    state.add(TodoItem(id: state.length, title: title));
    emit(List.from(state));
  }

  void markDone(TodoItem item) {
    state.firstWhere((element) => element.id == item.id).done = true;
    emit(List.from(state));
  }

  void remove(TodoItem item) {
    state.removeWhere((element) => element.id == item.id);
    emit(List.from(state));
  }
}
