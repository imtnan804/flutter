import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> enrolledStudents = [
    {
      'studentName': 'Alice Johnson',
      'teacherName': 'Mr. Smith',
      'creditHours': 3,
    },
    {
      'studentName': 'Bob Lee',
      'teacherName': 'Ms. Davis',
      'creditHours': 4,
    },
    {
      'studentName': 'Charlie Kim',
      'teacherName': 'Dr. Patel',
      'creditHours': 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home - Enrolled Students'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/logo.png', // Replace this with your actual image file name
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: enrolledStudents.length,
              itemBuilder: (context, index) {
                final student = enrolledStudents[index];
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text(student['studentName']),
                  subtitle: Text('Teacher: ${student['teacherName']}'),
                  trailing: Text('${student['creditHours']} hrs'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
