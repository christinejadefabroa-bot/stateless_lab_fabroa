
import 'package:flutter/material.dart';

void main() => runApp(const DirectoryApp());

// Stores student information without changing its fields.
class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

// Hard-coded sample data for the student directory.
const List<Student> students = [
  Student(
    name: 'Anna Santos',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'anna.santos@campus.edu',
  ),
  Student(
    name: 'Mark Reyes',
    course: 'BS Computer Science',
    yearLevel: 2,
    email: 'mark.reyes@campus.edu',
  ),
  Student(
    name: 'Sofia Cruz',
    course: 'BS Information Technology',
    yearLevel: 1,
    email: 'sofia.cruz@campus.edu',
  ),
  Student(
    name: 'John Garcia',
    course: 'BS Information Systems',
    yearLevel: 4,
    email: 'john.garcia@campus.edu',
  ),
  Student(
    name: 'Maria Dela Cruz',
    course: 'BS Computer Science',
    yearLevel: 3,
    email: 'maria.delacruz@campus.edu',
  ),
];
