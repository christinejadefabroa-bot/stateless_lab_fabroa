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

// Stateless because it displays only the supplied icon and text.
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.blue),
        const SizedBox(width: 6),
        Expanded(child: Text(text)),
      ],
    );
  }
}

// Stateless because its heading depends only on the supplied title.
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          // Customization 1: Bold blue section heading.
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const Divider(thickness: 1.5),
      ],
    );
  }
}

// Stateless because it displays the Student object passed to it.
class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Customization 2: Rounded corners for each student card.
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        // Customization 3: Extra padding inside each card.
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              // Customization 4: Light blue avatar background.
              backgroundColor: Colors.blue.shade100,
              child: Text(
                student.name[0].toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(student.course),
                  const SizedBox(height: 8),
                  InfoRow(
                    icon: Icons.school,
                    text: 'Year Level: ${student.yearLevel}',
                  ),
                  const SizedBox(height: 4),
                  InfoRow(icon: Icons.email, text: student.email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Stateless because the directory displays fixed student data.
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Directory'),
        // Customization 5: Blue app bar with white text.
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionHeader(title: 'Students'),
          const SizedBox(height: 8),
          ...students.map((student) => StudentCard(student: student)),
        ],
      ),
    );
  }
}

// Stateless because the app configuration remains fixed.
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Customization 6: Use a blue Material 3 theme.
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const DirectoryScreen(),
    );
  }
}
