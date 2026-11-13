import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  // ---------- Profile header (Row: avatar + Column of texts) ----------
  Widget buildProfileHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/student.png'),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Airo S. Parondo',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text('ID: 123-456-789', style: TextStyle(fontSize: 14)),
            Text('BSCS 4TH YEAR', style: TextStyle(fontSize: 14)),
          ],
        ),
      ],
    );
  }

  // ---------- Student information card (Card + 3 ListTiles) ----------
  Widget buildInfoCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: const [
            ListTile(
              leading: Icon(Icons.email),
              title: Text('airo.parondo@gmail.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('+63 912 345 6789'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('123 Buhangin,Davao City, Philippines'),
            ),
          ],
        ),
      ),
    );
  }

  // Subject Card
  Widget buildSubjectCard(String name, String instructor, String schedule) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(name),
        subtitle: Text('Instructor: $instructor\nSchedule: $schedule'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              print('Logout clicked');
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildProfileHeader(),
          const SizedBox(height: 16),
          buildInfoCard(),
          const SizedBox(height: 20),
          const Text(
            'Subjects',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          buildSubjectCard(
            'Mobile App Development',
            'Mr. Velez',
            'Mon/Fri 08:00 - 10:00 AM',
          ),
          buildSubjectCard(
            'Networking Fundamentals',
            'Mrs. Garcia',
            'Tue/Thu 1:00 - 2:30 PM',
          ),
          buildSubjectCard(
            'Operating Systems',
            'Dr. Lee',
            'Fri 8:00 - 11:00 AM',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Add Subject Clicked!');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
