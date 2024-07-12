import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Profile',
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTab(String label, IconData icon, Widget child) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "My Profile",
            style: GoogleFonts.ubuntu(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.person), text: 'Personal Info'),
            Tab(icon: Icon(Icons.school), text: 'Education'),
            Tab(icon: Icon(Icons.code), text: 'Skills'),
            Tab(icon: Icon(Icons.interests), text: 'Interests'),
            Tab(icon: Icon(Icons.contact_mail), text: 'Contact'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          personalInfoTab(),
          _buildTab('Education', Icons.school, educationTab()),
          _buildTab('Skills', Icons.code, skillsTab()),
          _buildTab('Interests', Icons.interests, interestsTab()),
          _buildTab('Contact', Icons.contact_mail, contactTab()),
        ],
      ),
    );
  }

  Widget personalInfoTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('images/myprofile1.jpg'), // Replace with your image asset
          ),
          SizedBox(height: 10),
          Text('Valerie Myca L. Candor', style: TextStyle(fontSize: 25)),
          Text('Age: 20', style: TextStyle(fontSize: 18)),
          Text('Incoming 4th Year IT Student', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget educationTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(
          title: Text('Bachelor of Science in Information Technology'),
          subtitle: Text('Batangas State University - TNEU, 2021 up to Present'),
        ),
        ListTile(
          title: Text('With Honors'),
          subtitle: Text('Gulod Senior High School, 2019 - 2021'),
        ),
        ListTile(
          title: Text('With Honors'),
          subtitle: Text('Batangas Nattional High School, 2015 - 2019'),
        ),
        // Add more ListTiles for other educational qualifications
      ],
    );
  }

  Widget skillsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Certifications',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text('NC II (Computer Systems Servicing)'),
                subtitle: const Text('TESDA Accredited, May 2021'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Skills',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text('Computer Literate'),
                subtitle: const Text('As a computer literate IT student, I am proficient in using computers and software applications, enabling effective coursework engagement and collaboration.'),
              ),
              ListTile(
                title: const Text('Adaptability and Willingness to Learn'),
                subtitle: const Text('My adaptability and strong willingness to learn empower me to swiftly adjust to new challenges and consistently broaden my IT skill set.'),
              ),
              ListTile(
                title: const Text('Good Communication'),
                subtitle: const Text('Good communication skills enable me to engage effectively in IT projects and collaborate seamlessly with teams.'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget interestsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(12),
          child: ListTile(
            title: Text('Database Management'),
            subtitle: Text(
              'As a student, I am dedicated to mastering Database Management. I focus on designing efficient databases, optimizing queries, and exploring advanced technologies to ensure data security and integrity. My goal is to excel in this field and contribute to innovative IT projects.',
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(12),
          child: ListTile(
            title: Text('IT Project Management'),
            subtitle: Text(
              'In my capstone project, I apply IT Project Management skills to plan and execute projects effectively. I coordinate team efforts, manage resources, and implement project plans using proven methodologies. My aim is to deliver successful IT projects that align with organizational objectives, ensuring they are completed on time and within budget.',
            ),
          ),
        ),
      ],
    );
  }

  Widget contactTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(
          leading: Icon(Icons.email),
          title: Text('valeriemyca.candor02@gmail.com'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('09458435609'),
        ),
        ListTile(
          leading: Icon(Icons.facebook),
          title: Text('Valerie Candor'),
        ),
        // Add more ListTiles for other contact methods
      ],
    );
  }
}
