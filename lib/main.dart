import 'package:flutter/material.dart';

void main() {
  runApp(const StudyMasterApp());
}

class StudyMasterApp extends StatelessWidget {
  const StudyMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyMaster - KPC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFD700), // Yellow
          brightness: Brightness.dark,
          primary: const Color(0xFFFFD700),
          onPrimary: Colors.black,
          surface: const Color(0xFF121212), // Deep Black
          onSurface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Color(0xFFFFD700),
          elevation: 0,
        ),
      ),
      home: const SplashEntranceScreen(),
    );
  }
}

// ============================================================================
// DATA MODELS & REPOSITORY
// ============================================================================

class StudentProfile {
  final String name;
  final String regNo;
  final String department;
  final String year;

  StudentProfile({
    required this.name,
    required this.regNo,
    required this.department,
    required this.year,
  });
}

class ChapterContent {
  final String chapterTitle;
  final String notesSummary;
  final List<String> links;
  final List<String> videoReferences;

  const ChapterContent({
    required this.chapterTitle,
    required this.notesSummary,
    required this.links,
    required this.videoReferences,
  });
}

class SubjectDetail {
  final String code;
  final String name;
  final List<ChapterContent> chapters;

  const SubjectDetail({
    required this.code,
    required this.name,
    required this.chapters,
  });
}

class FacultyMember {
  final String name;
  final String designation;
  final String subjects;
  final String yearGroup;

  const FacultyMember({
    required this.name,
    required this.designation,
    required this.subjects,
    required this.yearGroup,
  });
}

class AppDatabase {
  static final Map<String, StudentProfile> registeredProfiles = {
    '24501001': StudentProfile(
      name: 'Munch',
      regNo: '24501001',
      department: 'CT (Computer Technology)',
      year: 'Year 2',
    ),
  };

  static const List<FacultyMember> facultyList = [
    // Year 1 Staffs
    FacultyMember(
      name: 'Ms. Divya',
      designation: 'Lecturer / Year 1 Staff',
      subjects: 'Applied Math & Basic Science',
      yearGroup: 'Year 1 Staff',
    ),
    FacultyMember(
      name: 'Ms. Meena',
      designation: 'Lecturer / Year 1 Staff',
      subjects: 'Engineering Physics & Lab',
      yearGroup: 'Year 1 Staff',
    ),
    FacultyMember(
      name: 'Mr. Sathis Kumar',
      designation: 'Lecturer / Year 1 Staff',
      subjects: 'Engineering Graphics & Workshop',
      yearGroup: 'Year 1 Staff',
    ),
    FacultyMember(
      name: 'Mr. Senthil Kumar',
      designation: 'HOD / Year 1 Staff',
      subjects: 'Communication Skills & Mathematics',
      yearGroup: 'Year 1 Staff',
    ),
    FacultyMember(
      name: 'Ms. Rajalakshmi',
      designation: 'Lecturer / Year 1 Staff',
      subjects: 'Applied Science Labs',
      yearGroup: 'Year 1 Staff',
    ),

    // Year 2 CT Department Staffs
    FacultyMember(
      name: 'Ms. Sowndhiri',
      designation: 'Lecturer / CT Dept',
      subjects: 'Operating Systems & Linux Lab',
      yearGroup: 'Year 2 CT Staff',
    ),
    FacultyMember(
      name: 'Mr. Murugesan',
      designation: 'Senior Lecturer / CT Dept',
      subjects: 'C Programming & Data Structures',
      yearGroup: 'Year 2 CT Staff',
    ),
    FacultyMember(
      name: 'Ms. Sethalakshmi',
      designation: 'Lecturer / CT Dept',
      subjects: 'Python & Scripting Languages',
      yearGroup: 'Year 2 CT Staff',
    ),
  ];

  static const List<SubjectDetail> subjects = [
    SubjectDetail(
      code: '1052233230',
      name: 'Relational Database Management Systems (RDBMS)',
      chapters: [
        ChapterContent(
          chapterTitle: 'Chapter 1: Relational Model & Architecture',
          notesSummary:
              'Covers Codd’s 12 rules, data models, schema architecture, and database instances.',
          links: [
            'https://dev.mysql.com/doc/',
            'https://www.mysqltutorial.org/',
          ],
          videoReferences: [
            'MySQL Architecture Overview',
            'Database Normalization Demo',
          ],
        ),
        ChapterContent(
          chapterTitle: 'Chapter 2: SQL Commands & Functions',
          notesSummary:
              'DDL, DML, DRL commands, single-row string/numeric functions, and group aggregate functions.',
          links: ['https://www.w3schools.com/sql/'],
          videoReferences: ['SQL Aggregate Functions Masterclass'],
        ),
        ChapterContent(
          chapterTitle: 'Chapter 3: Flow Control & Subqueries',
          notesSummary:
              'IF(), CASE, WHILE, LOOP, REPEAT statements, subqueries (ANY, ALL, IN), and Correlated subqueries.',
          links: [
            'https://dev.mysql.com/doc/refman/8.0/en/flow-control-statements.html',
          ],
          videoReferences: ['MySQL Stored Procedures & Flow Control'],
        ),
        ChapterContent(
          chapterTitle: 'Chapter 4: Performance Tuning & Joins',
          notesSummary:
              'Indexing (Simple, Unique, Composite), AUTO_INCREMENT sequences, INNER/OUTER/SELF Joins, and Transactions.',
          links: ['https://dev.mysql.com/doc/refman/8.0/en/optimization.html'],
          videoReferences: ['Understanding MySQL Joins Visually'],
        ),
      ],
    ),
    SubjectDetail(
      code: '1052233210',
      name: 'Digital Logic Design (DLD)',
      chapters: [
        ChapterContent(
          chapterTitle: 'Chapter 1: Number Systems & Logic Gates',
          notesSummary:
              '1’s and 2’s complements, binary arithmetic, and basic gates (OR, AND, NOT, EX-OR).',
          links: ['https://www.electronics-tutorials.ws/'],
          videoReferences: ['Logic Gates Truth Table Verification'],
        ),
        ChapterContent(
          chapterTitle: 'Chapter 2: Combinational Circuits',
          notesSummary:
              'De Morgan’s theorems, Half/Full Adders, Subtractors, Multiplexers, and Comparators.',
          links: ['https://www.allaboutcircuits.com/'],
          videoReferences: ['Full Adder IC 7486 & 7408 Circuit Wiring'],
        ),
        ChapterContent(
          chapterTitle: 'Chapter 3: Sequential Logic Design',
          notesSummary:
              'SR Flip-Flop, JK Flip-Flop, SIPO, and PISO shift registers.',
          links: ['https://www.tutorialspoint.com/digital_circuits/'],
          videoReferences: ['Working of JK Flip-Flops and Shift Registers'],
        ),
      ],
    ),
  ];
}

// ============================================================================
// 1. SPLASH ENTRANCE SCREEN (Single Frame)
// ============================================================================

class SplashEntranceScreen extends StatelessWidget {
  const SplashEntranceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD700).withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.menu_book_rounded,
                  size: 68,
                  color: Color(0xFFFFD700),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'STUDYMASTER',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.5,
                  color: Color(0xFFFFD700),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Kongu Polytechnic College • Academic Hub',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              const SizedBox(height: 48),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const AuthGatewayScreen(),
                    ),
                  );
                },
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFFFD700),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 14,
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// 2. AUTH GATEWAY (Login with Reg No or New Registration)
// ============================================================================

class AuthGatewayScreen extends StatefulWidget {
  const AuthGatewayScreen({super.key});

  @override
  State<AuthGatewayScreen> createState() => _AuthGatewayScreenState();
}

class _AuthGatewayScreenState extends State<AuthGatewayScreen> {
  final _loginRegController = TextEditingController();

  void _handleLogin() {
    String regNo = _loginRegController.text.trim();
    if (AppDatabase.registeredProfiles.containsKey(regNo)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              DashboardScreen(profile: AppDatabase.registeredProfiles[regNo]!),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Register number not found. Try 24501001 or register below!',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Portal Access')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Enter your register number to access your saved profile instantly.',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _loginRegController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Register Number (e.g., 24501001)',
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFFD700)),
                ),
                prefixIcon: Icon(
                  Icons.badge_outlined,
                  color: Color(0xFFFFD700),
                ),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: _handleLogin,
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFFFD700),
                foregroundColor: Colors.black,
              ),
              child: const Text(
                'Login with Register Number',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(height: 40, color: Colors.white24),
            const Text(
              'New Student?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Create your profile to get started with StudyMaster.',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 14),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegistrationScreen()),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFFFFD700),
                side: const BorderSide(color: Color(0xFFFFD700)),
              ),
              child: const Text(
                'Register New Profile',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// REGISTRATION PAGE
// ============================================================================

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _nameController = TextEditingController();
  final _regController = TextEditingController();
  String _dept = 'CT (Computer Technology)';
  String _year = 'Year 2';

  void _saveProfile() {
    if (_nameController.text.isEmpty || _regController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }

    final newProfile = StudentProfile(
      name: _nameController.text.trim(),
      regNo: _regController.text.trim().toUpperCase(),
      department: _dept,
      year: _year,
    );

    AppDatabase.registeredProfiles[newProfile.regNo] = newProfile;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => DashboardScreen(profile: newProfile)),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Registration')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Full Name',
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFFD700)),
                ),
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: _regController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Register Number',
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFFD700)),
                ),
              ),
            ),
            const SizedBox(height: 14),
            DropdownButtonFormField<String>(
              initialValue: _dept,
              dropdownColor: const Color(0xFF1E1E1E),
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Department',
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFFD700)),
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'CT (Computer Technology)',
                  child: Text('CT (Computer Technology)'),
                ),
                DropdownMenuItem(
                  value: 'Mechanical Engineering',
                  child: Text('Mechanical Engineering'),
                ),
                DropdownMenuItem(
                  value: 'Civil Engineering',
                  child: Text('Civil Engineering'),
                ),
              ],
              onChanged: (val) => setState(() => _dept = val!),
            ),
            const SizedBox(height: 14),
            DropdownButtonFormField<String>(
              initialValue: _year,
              dropdownColor: const Color(0xFF1E1E1E),
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Academic Year',
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFFD700)),
                ),
              ),
              items: const [
                DropdownMenuItem(value: 'Year 1', child: Text('Year 1')),
                DropdownMenuItem(value: 'Year 2', child: Text('Year 2')),
              ],
              onChanged: (val) => setState(() => _year = val!),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _saveProfile,
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFFFD700),
                foregroundColor: Colors.black,
              ),
              child: const Text(
                'Save Profile & Enter App',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// 3. STUDENT DASHBOARD & DEDICATED SUCCESSFUL / RESUME PAGE
// ============================================================================

class DashboardScreen extends StatefulWidget {
  final StudentProfile profile;
  const DashboardScreen({super.key, required this.profile});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeFeedTab(profile: widget.profile),
      const NotesDirectoryTab(),
      const FacultyChatTab(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentIndex == 0
              ? 'Dashboard • ${widget.profile.name}'
              : _currentIndex == 1
              ? 'Subject Notes & Resources'
              : 'Faculty Chat Space',
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF121212),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.black),
              accountName: Text(
                widget.profile.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              accountEmail: Text(
                '${widget.profile.department} • ${widget.profile.regNo}',
                style: const TextStyle(color: Color(0xFFFFD700)),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: const Color(0xFFFFD700),
                child: Text(
                  widget.profile.name[0],
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_rounded, color: Color(0xFFFFD700)),
              title: const Text(
                'Home & Progress Feed',
                style: TextStyle(color: Colors.white),
              ),
              selected: _currentIndex == 0,
              onTap: () {
                setState(() => _currentIndex = 0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.menu_book_rounded,
                color: Color(0xFFFFD700),
              ),
              title: const Text(
                'Notes, PDFs & Question Papers',
                style: TextStyle(color: Colors.white),
              ),
              selected: _currentIndex == 1,
              onTap: () {
                setState(() => _currentIndex = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.chat_bubble_outline_rounded,
                color: Color(0xFFFFD700),
              ),
              title: const Text(
                'Faculty Chat Space',
                style: TextStyle(color: Colors.white),
              ),
              selected: _currentIndex == 2,
              onTap: () {
                setState(() => _currentIndex = 2);
                Navigator.pop(context);
              },
            ),
            const Divider(color: Colors.white24),
            ListTile(
              leading: const Icon(
                Icons.logout_rounded,
                color: Colors.redAccent,
              ),
              title: const Text(
                'Switch Profile / Logout',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const AuthGatewayScreen()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF121212),
        indicatorColor: const Color(0xFFFFD700).withOpacity(0.3),
        selectedIndex: _currentIndex,
        onDestinationSelected: (idx) => setState(() => _currentIndex = idx),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined, color: Colors.white70),
            selectedIcon: Icon(Icons.dashboard, color: Color(0xFFFFD700)),
            label: 'Progress',
          ),
          NavigationDestination(
            icon: Icon(Icons.folder_outlined, color: Colors.white70),
            selectedIcon: Icon(Icons.folder, color: Color(0xFFFFD700)),
            label: 'Notes Hub',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_outlined, color: Colors.white70),
            selectedIcon: Icon(Icons.chat, color: Color(0xFFFFD700)),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// HOME FEED TAB: Completed, Resume, Left out, Scores & Daily Tweaks
// ============================================================================

class HomeFeedTab extends StatelessWidget {
  final StudentProfile profile;
  const HomeFeedTab({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          color: const Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFFFFD700), width: 1),
          ),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back, ${profile.name}!',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFD700),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Reg No: ${profile.regNo} | Dept: ${profile.department}',
                  style: const TextStyle(fontSize: 13, color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          color: const Color(0xFF1E1E1E),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD700).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.emoji_events_rounded,
                    color: Color(0xFFFFD700),
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last Test Score: RDBMS Unit 3 Quiz',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Score: 24 / 25 (96% - Excellent Grade)',
                        style: TextStyle(
                          color: Color(0xFFFFD700),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Successfully Completed Resources',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        const Card(
          color: Color(0xFF1E1E1E),
          child: ListTile(
            leading: Icon(Icons.check_circle, color: Color(0xFFFFD700)),
            title: Text(
              'RDBMS Unit 1 & Unit 2 Notes',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Fully mastered and tested successfully.',
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Resume Learning',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        Card(
          color: const Color(0xFF1E1E1E),
          child: ListTile(
            leading: const Icon(
              Icons.play_circle_fill_rounded,
              color: Color(0xFFFFD700),
            ),
            title: const Text(
              'DLD Unit 3: Sequential Logic & Shift Registers',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              'Left off at: SIPO vs PISO Converter timing diagrams.',
              style: TextStyle(color: Colors.white70),
            ),
            trailing: FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFFFD700),
                foregroundColor: Colors.black,
              ),
              child: const Text(
                'Resume',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Left Out Resources',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        const Card(
          color: Color(0xFF1E1E1E),
          child: ListTile(
            leading: Icon(
              Icons.warning_amber_rounded,
              color: Colors.amberAccent,
            ),
            title: Text(
              'DLD Unit 4: Sensor & Relay Interfacing',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Not started yet. Recommended to complete this week.',
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'What’s New & Daily Tweaks',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        const Card(
          color: Color(0xFF1E1E1E),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🔥 PolyQBase Model Papers Updated',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFD700),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'April 2026 Board Practicum question papers have been added to the question bank library.',
                  style: TextStyle(color: Colors.white70),
                ),
                Divider(height: 20, color: Colors.white24),
                Text(
                  '💡 Daily Study Tip',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFD700),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Use active recall when reviewing SQL joins and truth tables to improve long-term retention.',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// 4. NOTES DIRECTORY & SPECIFIC SUBJECT CHAPTER WORKSPACE
// ============================================================================

class NotesDirectoryTab extends StatelessWidget {
  const NotesDirectoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: AppDatabase.subjects.length,
      itemBuilder: (context, index) {
        final subject = AppDatabase.subjects[index];
        return Card(
          color: const Color(0xFF1E1E1E),
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: const Icon(Icons.book_rounded, color: Color(0xFFFFD700)),
            title: Text(
              subject.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'Code: ${subject.code} • ${subject.chapters.length} Chapters',
              style: const TextStyle(color: Colors.white70),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Color(0xFFFFD700),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SubjectChaptersScreen(subject: subject),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class SubjectChaptersScreen extends StatelessWidget {
  final SubjectDetail subject;
  const SubjectChaptersScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subject.code)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: subject.chapters.length,
        itemBuilder: (context, index) {
          final chapter = subject.chapters[index];
          return Card(
            color: const Color(0xFF1E1E1E),
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              collapsedIconColor: const Color(0xFFFFD700),
              iconColor: const Color(0xFFFFD700),
              title: Text(
                chapter.chapterTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              subtitle: const Text(
                'Tap to open Notes, PDFs, Videos & Question Papers',
                style: TextStyle(color: Colors.white70),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        chapter.notesSummary,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          ActionChip(
                            backgroundColor: Colors.black,
                            labelStyle: const TextStyle(color: Colors.white),
                            avatar: const Icon(
                              Icons.notes,
                              size: 16,
                              color: Color(0xFFFFD700),
                            ),
                            label: const Text('Notes'),
                            onPressed: () => _showContentDialog(
                              context,
                              'Notes',
                              chapter.notesSummary,
                            ),
                          ),
                          ActionChip(
                            backgroundColor: Colors.black,
                            labelStyle: const TextStyle(color: Colors.white),
                            avatar: const Icon(
                              Icons.picture_as_pdf,
                              size: 16,
                              color: Colors.redAccent,
                            ),
                            label: const Text('PDF Manual'),
                            onPressed: () => _showContentDialog(
                              context,
                              'PDF Manual',
                              'Viewing official chapter PDF resource for ${chapter.chapterTitle}.',
                            ),
                          ),
                          ActionChip(
                            backgroundColor: Colors.black,
                            labelStyle: const TextStyle(color: Colors.white),
                            avatar: const Icon(
                              Icons.play_circle_filled,
                              size: 16,
                              color: Colors.lightBlueAccent,
                            ),
                            label: const Text('Videos'),
                            onPressed: () => _showContentDialog(
                              context,
                              'Video Ref',
                              'Videos: ${chapter.videoReferences.join(", ")}',
                            ),
                          ),
                          ActionChip(
                            backgroundColor: Colors.black,
                            labelStyle: const TextStyle(color: Colors.white),
                            avatar: const Icon(
                              Icons.link,
                              size: 16,
                              color: Colors.greenAccent,
                            ),
                            label: const Text('Links'),
                            onPressed: () => _showContentDialog(
                              context,
                              'External Links',
                              'Links: ${chapter.links.join("\n")}',
                            ),
                          ),
                          ActionChip(
                            backgroundColor: Colors.black,
                            labelStyle: const TextStyle(color: Colors.white),
                            avatar: const Icon(
                              Icons.quiz,
                              size: 16,
                              color: Color(0xFFFFD700),
                            ),
                            label: const Text('Previous Year QPs'),
                            onPressed: () => _showContentDialog(
                              context,
                              'Previous Year QPs',
                              'Board Model Question Paper & 10-mark solved answers available for this chapter.',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showContentDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        title: Text(title, style: const TextStyle(color: Color(0xFFFFD700))),
        content: Text(content, style: const TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Close',
              style: TextStyle(color: Color(0xFFFFD700)),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// 5. FACULTY CHAT SPACE (With Year 1 and Year 2 CT Staff Distinction)
// ============================================================================

class FacultyChatTab extends StatelessWidget {
  const FacultyChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Faculty Consultation & Doubt Clearance',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Select a faculty member below to connect and clear your doubts.',
          style: TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 16),
        ...AppDatabase.facultyList.map(
          (faculty) => Card(
            color: const Color(0xFF1E1E1E),
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFFFFD700),
                child: Text(
                  faculty.name[4],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              title: Text(
                faculty.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                '${faculty.designation}\nSubjects: ${faculty.subjects}\nGroup: ${faculty.yearGroup}',
                style: const TextStyle(color: Colors.white70),
              ),
              isThreeLine: true,
              trailing: FilledButton.tonal(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFFFD700).withOpacity(0.15),
                  foregroundColor: const Color(0xFFFFD700),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatConversationScreen(faculty: faculty),
                    ),
                  );
                },
                child: const Text('Chat'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ChatConversationScreen extends StatefulWidget {
  final FacultyMember faculty;
  const ChatConversationScreen({super.key, required this.faculty});

  @override
  State<ChatConversationScreen> createState() => _ChatConversationScreenState();
}

class _ChatConversationScreenState extends State<ChatConversationScreen> {
  late final List<String> _messages;
  final _msgController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _messages = [
      'Hello! Ask your academic doubts regarding ${widget.faculty.subjects}.',
    ];
  }

  void _sendMessage() {
    if (_msgController.text.trim().isEmpty) return;
    setState(() {
      _messages.add('You: ${_msgController.text.trim()}');
      _messages.add(
        '${widget.faculty.name}: Thank you for your question. I have noted your doubt and will assist you with this concept!',
      );
      _msgController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat with ${widget.faculty.name}')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isUser = msg.startsWith('You:');
                return Align(
                  alignment: isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser
                          ? const Color(0xFFFFD700)
                          : const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isUser
                            ? const Color(0xFFFFD700)
                            : Colors.white24,
                      ),
                    ),
                    child: Text(
                      msg,
                      style: TextStyle(
                        color: isUser ? Colors.black : Colors.white,
                        fontWeight: isUser
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: const Color(0xFF121212),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _msgController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Type your academic doubt here...',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white24),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFFFD700)),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  onPressed: _sendMessage,
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD700),
                    foregroundColor: Colors.black,
                  ),
                  icon: const Icon(Icons.send_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
