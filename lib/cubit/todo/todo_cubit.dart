import 'package:bloc/bloc.dart';
import 'package:todo/model/todo_item.dart';

class TodoCubit extends Cubit<List<TodoItem>> {
  TodoCubit() : super([]);

  void addItem(TodoItem item) {
    state.add(item);
    emit(List.from(state));
  }
}
