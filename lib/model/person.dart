class Person {
  String firstName;
  String lastName;
  int age;

  Person({required this.firstName, required this.lastName, this.age = 99});

  String get fullName => '$firstName $lastName';

  factory Person.empty() => Person(firstName: 'No', lastName: 'Name');
}
