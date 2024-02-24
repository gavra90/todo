import 'package:bloc/bloc.dart';
import 'package:todo/model/person.dart';

class PersonCubit extends Cubit<Person> {
  PersonCubit() : super(Person.empty());

  void changeName(String firstName, String lastName) {
    emit(Person(firstName: firstName, lastName: lastName, age: state.age));
  }

  void changeAge(int age) {
    emit(Person(firstName: state.firstName, lastName: state.lastName, age: age));
  }
}
