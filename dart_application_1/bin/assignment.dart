import 'dart:io';

// Interface for a printable object
abstract class Printable {
  void printData();
}

// Base class representing a person
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  // Method to print person's details
  void printDetails() {
    print('Name: $name');
    print('Age: $age');
  }
}

// Derived class representing a student
class Student extends Person implements Printable {
  String school;

  Student(String name, int age, this.school) : super(name, age);

  @override
  void printDetails() {
    super.printDetails();
    print('School: $school');
  }

  @override
  void printData() {
    printDetails();
  }
}

// Function to read data from a file and create a Student instance
Student createStudentFromFile(String filePath) {
  File file = File(filePath);
  List<String> lines = file.readAsLinesSync();
  String name = lines[0];
  int age = int.parse(lines[1]);
  String school = lines[2];
  return Student(name, age, school);
}

// Function to demonstrate the use of a loop
void printNumbers(int n) {
  for (int i = 1; i <= n; i++) {
    print(i);
  }
}

void main() {
  // Create a student from file data
  Student student = createStudentFromFile('student_data.txt');

  // Print student details
  student.printDetails();

  // Use the printable interface to print student data
  Printable printableStudent = student;
  printableStudent.printData();

  // Demonstrate the use of a loop
  printNumbers(5);
}
