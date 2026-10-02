import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const StudentAttendanceApp());
}

// ============================================================
// COLORS & THEME CONSTANTS
// ============================================================

class AppColors {
  static const Color background = Color(0xFF0F172A);
  static const Color surface = Color(0xFF1E293B);
  static const Color primary = Color(0xFF1591DC);
  static const Color secondary = Color(0xFF38BDF8);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF1591DC), Color(0xFF38BDF8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient surfaceGradient = LinearGradient(
    colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

// ============================================================
// APP
// ============================================================

class StudentAttendanceApp extends StatelessWidget {
  const StudentAttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Attendance',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.dark(
          primary: AppColors.primary,
          surface: AppColors.surface,
          onSurface: AppColors.textPrimary,
        ),
        cardTheme: CardThemeData(
          color: AppColors.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
        ),
      ),
      home: const LoginPage(),
    );
  }
}

// ============================================================
// DATA MODELS
// ============================================================

class Subject {
  final int id;
  final String name;
  final String code;
  final String faculty;
  final String type;
  final int total;
  final int present;
  final List<AttendanceEntry> history;

  Subject({
    required this.id,
    required this.name,
    required this.code,
    required this.faculty,
    required this.type,
    required this.total,
    required this.present,
    required this.history,
  });

  int get absent => total - present;

  double get percentage =>
      total == 0 ? 0 : (present / total) * 100;
}

class AttendanceEntry {
  final int srNo;
  final String date;
  final String period;
  final String status;

  AttendanceEntry({
    required this.srNo,
    required this.date,
    required this.period,
    required this.status,
  });
}

// ============================================================
// DEMO DATA
// ============================================================

List<Subject> subjects = [
  Subject(
    id: 1,
    name: 'Modern Indian Language: Hindi I',
    code: 'UAEHIS3-243',
    faculty: 'MALTI YADAV',
    type: 'Theory',
    total: 15,
    present: 10,
    history: [
      AttendanceEntry(srNo: 1, date: '7/10/2026', period: 'SLOT 43', status: 'P'),
      AttendanceEntry(srNo: 2, date: '7/14/2026', period: 'SLOT 43', status: 'P'),
      AttendanceEntry(srNo: 3, date: '7/17/2026', period: 'BIOTECH SY 3', status: 'A'),
      AttendanceEntry(srNo: 4, date: '7/24/2026', period: 'SLOT 43', status: 'A'),
      AttendanceEntry(srNo: 5, date: '7/31/2026', period: 'SLOT 43', status: 'P'),
      AttendanceEntry(srNo: 6, date: '8/4/2026', period: 'SLOT 43', status: 'P'),
      AttendanceEntry(srNo: 7, date: '8/7/2026', period: 'SLOT 43', status: 'P'),
      AttendanceEntry(srNo: 8, date: '8/11/2026', period: 'BIOTECH SY 3', status: 'A'),
      AttendanceEntry(srNo: 9, date: '8/14/2026', period: 'BIOTECH SY 3', status: 'A'),
      AttendanceEntry(srNo: 10, date: '8/18/2026', period: 'BIOTECH SY 3', status: 'P'),
      AttendanceEntry(srNo: 11, date: '8/21/2026', period: 'SLOT 43', status: 'P'),
      AttendanceEntry(srNo: 12, date: '8/25/2026', period: 'BIOTECH SY 3', status: 'P'),
      AttendanceEntry(srNo: 13, date: '9/1/2026', period: 'BIOTECH SY 3', status: 'P'),
      AttendanceEntry(srNo: 14, date: '9/4/2026', period: 'SLOT 43', status: 'A'),
      AttendanceEntry(srNo: 15, date: '9/8/2026', period: 'SLOT 43', status: 'A'),
    ],
  ),
  Subject(
    id: 2,
    name: 'Data Structures',
    code: 'UMMITS3-201',
    faculty: 'SHITAL SAMBHAJI PATIL',
    type: 'Theory',
    total: 17,
    present: 15,
    history: _history(17, 15, 'SLOT 21'),
  ),
  Subject(
    id: 3,
    name: 'Microprocessor & Microcontroller',
    code: 'UMMITS3-202',
    faculty: 'NAIM SADIK SHAIKH',
    type: 'Theory',
    total: 8,
    present: 8,
    history: _history(8, 8, 'SLOT 15'),
  ),
  Subject(
    id: 4,
    name: 'Discrete Mathematics',
    code: 'UMMITS3-203',
    faculty: 'RAJESH KUMAR',
    type: 'Theory',
    total: 18,
    present: 14,
    history: _history(18, 14, 'SLOT 18'),
  ),
  Subject(
    id: 5,
    name: 'Software Engineering',
    code: 'UMMITS3-204',
    faculty: 'PRIYA SHARMA',
    type: 'Theory',
    total: 16,
    present: 13,
    history: _history(16, 13, 'SLOT 25'),
  ),
  Subject(
    id: 6,
    name: 'Open Elective',
    code: 'UMMITS3-205',
    faculty: 'AMIT DESAI',
    type: 'Theory',
    total: 14,
    present: 11,
    history: _history(14, 11, 'SLOT 31'),
  ),
  Subject(
    id: 7,
    name: 'Mobile Programming',
    code: 'UMMITS3-301',
    faculty: 'RAHUL SHINDE',
    type: 'Practical',
    total: 10,
    present: 9,
    history: _history(10, 9, 'LAB 1'),
  ),
  Subject(
    id: 8,
    name: 'Data Structures Practical',
    code: 'UMMITS3-302',
    faculty: 'SHITAL SAMBHAJI PATIL',
    type: 'Practical',
    total: 10,
    present: 8,
    history: _history(10, 8, 'LAB 2'),
  ),
  Subject(
    id: 9,
    name: 'MPMC Practical',
    code: 'UMMITS3-303',
    faculty: 'NAIM SADIK SHAIKH',
    type: 'Practical',
    total: 10,
    present: 9,
    history: _history(10, 9, 'LAB 3'),
  ),
  Subject(
    id: 10,
    name: 'DM Practical',
    code: 'UMMITS3-304',
    faculty: 'RAJESH KUMAR',
    type: 'Practical',
    total: 10,
    present: 8,
    history: _history(10, 8, 'LAB 4'),
  ),
];

List<AttendanceEntry> _history(int total, int present, String period) {
  List<AttendanceEntry> list = [];
  for (int i = 1; i <= total; i++) {
    list.add(
      AttendanceEntry(
        srNo: i,
        date: '8/${i + 1}/2026',
        period: period,
        status: i <= present ? 'P' : 'A',
      ),
    );
  }
  return list;
}

// ============================================================
// LOGIN PAGE
// ============================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool hidePassword = true;

  Future<void> login() async {
    String inputUsername = usernameController.text.trim();
    String inputPassword = passwordController.text.trim();

    try {
      final String data = await rootBundle.loadString('assets/users.txt');
      final List<String> lines = data.split('\n');

      bool authenticated = false;
      for (var line in lines) {
        if (line.trim().isEmpty) continue;
        final parts = line.split(':');
        if (parts.length == 2) {
          final String fileUsername = parts[0].trim();
          final String filePassword = parts[1].trim();

          if (inputUsername == fileUsername && inputPassword == filePassword) {
            authenticated = true;
            break;
          }
        }
      }

      if (authenticated) {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPage(username: inputUsername)),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Invalid username or password'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading users: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.background, Color(0xFF1E293B)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 5,
                        )
                      ],
                    ),
                    child: ShaderMask(
                      shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                      child: const Icon(
                        Icons.school_rounded,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sign in to your student portal',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 48),
                  TextField(
                    controller: usernameController,
                    style: const TextStyle(color: AppColors.textPrimary),
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: const TextStyle(color: AppColors.textSecondary),
                      prefixIcon: const Icon(Icons.person_outline, color: AppColors.primary),
                      filled: true,
                      fillColor: AppColors.surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.white.withOpacity(0.05)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: AppColors.primary, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: hidePassword,
                    style: const TextStyle(color: AppColors.textPrimary),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: AppColors.textSecondary),
                      prefixIcon: const Icon(Icons.lock_outline, color: AppColors.primary),
                      suffixIcon: IconButton(
                        icon: Icon(
                          hidePassword ? Icons.visibility_off : Icons.visibility,
                          color: AppColors.textSecondary,
                        ),
                        onPressed: () => setState(() => hidePassword = !hidePassword),
                      ),
                      filled: true,
                      fillColor: AppColors.surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.white.withOpacity(0.05)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: AppColors.primary, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: AppColors.primaryGradient,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        )
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.background,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Academic Session 2026 - 2027',
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// MAIN PAGE WITH BOTTOM NAVIGATION
// ============================================================

class MainPage extends StatefulWidget {
  final String username;
  const MainPage({super.key, required this.username});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      DashboardPage(username: widget.username),
      const AttendancePage(),
      const SubjectsPage(),
      const TimeTablePage(),
      ProfilePage(username: widget.username),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, -5),
            )
          ],
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: AppColors.primary.withOpacity(0.1),
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold);
              }
              return const TextStyle(color: AppColors.textSecondary);
            }),
            iconTheme: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(color: AppColors.primary);
              }
              return const IconThemeData(color: AppColors.textSecondary);
            }),
          ),
          child: NavigationBar(
            backgroundColor: AppColors.surface,
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) => setState(() => selectedIndex = index),
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.fact_check_outlined), selectedIcon: Icon(Icons.fact_check), label: 'Attendance'),
              NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book), label: 'Subjects'),
              NavigationDestination(icon: Icon(Icons.calendar_today_outlined), selectedIcon: Icon(Icons.calendar_today), label: 'Timetable'),
              NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// DASHBOARD
// ============================================================

class DashboardPage extends StatelessWidget {
  final String username;
  const DashboardPage({super.key, required this.username});

  double getPercentage(String type) {
    // Generate distinct metrics unique to each user's username length/hash
    int seedValue = username.hashCode.abs() % 6;

    final filtered = type == 'Overall' ? subjects : subjects.where((s) => s.type == type).toList();
    int total = 0, present = 0;
    for (var s in filtered) {
      total += s.total;
      // Inject unique attendance behavior per user
      if (type == 'Theory') {
        present += (s.present - (seedValue % 3)).clamp(4, s.total);
      } else if (type == 'Practical') {
        present += (s.present + (seedValue % 2)).clamp(5, s.total);
      } else {
        present += s.present;
      }
    }
    return total == 0 ? 0 : present / total * 100;
  }

  @override
  Widget build(BuildContext context) {
    final double theory = getPercentage('Theory');
    final double practical = getPercentage('Practical');
    final double overall = getPercentage('Overall');

    // Capitalize the first letter for display name
    final String displayName = username.isNotEmpty
        ? '${username[0].toUpperCase()}${username.substring(1)}'
        : 'Student';

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: 2),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.surface,
                      child: Icon(Icons.person, size: 36, color: AppColors.primary),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Welcome back,', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                        Text(
                          displayName,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_outlined, color: AppColors.primary),
                    style: IconButton.styleFrom(backgroundColor: AppColors.surface),
                  )
                ],
              ),
              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: const [
                    Text(
                      'VES COLLEGE OF ARTS, SCIENCE & COMMERCE',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.background, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'BCA Student • 2026-2027',
                      style: TextStyle(color: AppColors.background, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text('Attendance Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 130,
                      height: 130,
                      child: CustomPaint(
                        painter: AttendancePiePainter(
                          theory: theory,
                          practical: practical,
                          overall: overall,
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLegendItem('Theory', theory, AppColors.primary),
                          const SizedBox(height: 10),
                          _buildLegendItem('Practical', practical, AppColors.secondary),
                          const SizedBox(height: 10),
                          _buildLegendItem('Overall', overall, AppColors.success),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, double val, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
        ),
        Text(
          '${val.toInt()}%',
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// ============================================================
// DASHBOARD COMPONENTS
// ============================================================

class AttendancePiePainter extends CustomPainter {
  final double theory;
  final double practical;
  final double overall;

  AttendancePiePainter({required this.theory, required this.practical, required this.overall});

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2;
    final Rect rect = Rect.fromCircle(center: center, radius: radius);

    final double totalValues = theory + practical + overall;
    if (totalValues == 0) return;

    final double sweep1 = (theory / totalValues) * 2 * 3.141592653589793;
    final double sweep2 = (practical / totalValues) * 2 * 3.141592653589793;
    final double sweep3 = (overall / totalValues) * 2 * 3.141592653589793;

    final Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Theory Slice
    paint.color = AppColors.primary;
    canvas.drawArc(rect, -3.141592653589793 / 2, sweep1, true, paint);

    // Practical Slice
    paint.color = AppColors.secondary;
    canvas.drawArc(rect, -3.141592653589793 / 2 + sweep1, sweep2, true, paint);

    // Overall Slice
    paint.color = AppColors.success;
    canvas.drawArc(rect, -3.141592653589793 / 2 + sweep1 + sweep2, sweep3, true, paint);

    // Inner clear hole for donut look
    final Paint centerHolePaint = Paint()..color = AppColors.surface;
    canvas.drawCircle(center, radius * 0.55, centerHolePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// ============================================================
// ATTENDANCE PAGE
// ============================================================

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  DateTime? fromDate;
  DateTime? toDate;
  String selectedType = 'All';

  Future<void> selectDate(bool isFrom) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2026, 8, 1),
      firstDate: DateTime(2026, 1, 1),
      lastDate: DateTime(2027, 12, 31),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.dark(
            primary: AppColors.primary,
            onPrimary: AppColors.background,
            surface: AppColors.surface,
            onSurface: AppColors.textPrimary,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => isFrom ? fromDate = picked : toDate = picked);
  }

  String formatDate(DateTime? date) =>
      date == null ? 'DD/MM/YYYY' : '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';

  @override
  Widget build(BuildContext context) {
    final filtered = selectedType == 'All' ? subjects : subjects.where((s) => s.type == selectedType).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Details', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _dateItem('From', formatDate(fromDate), () => selectDate(true))),
                    const SizedBox(width: 16),
                    Expanded(child: _dateItem('To', formatDate(toDate), () => selectDate(false))),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(gradient: AppColors.primaryGradient, borderRadius: BorderRadius.circular(16)),
                    alignment: Alignment.center,
                    child: const Text('Show Results',
                        style: TextStyle(color: AppColors.background, fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: ['All', 'Theory', 'Practical']
                  .map((t) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(t),
                    selected: selectedType == t,
                    onSelected: (val) => setState(() => selectedType = t),
                    selectedColor: AppColors.primary,
                    backgroundColor: AppColors.surface,
                    labelStyle: TextStyle(color: selectedType == t ? AppColors.background : AppColors.textSecondary),
                    showCheckmark: false,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ))
                  .toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: filtered.length,
              itemBuilder: (context, index) => SubjectAttendanceCard(subject: filtered[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateItem(String label, String value, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
        const SizedBox(height: 8),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today_rounded, size: 16, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(value, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SubjectAttendanceCard extends StatelessWidget {
  final Subject subject;
  const SubjectAttendanceCard({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    final bool isLow = subject.percentage < 75;
    final Color progressColor = isLow ? AppColors.warning : AppColors.success;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(subject.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(subject.code, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AttendanceDetailPage(subject: subject))),
                child: const Text('Details', style: TextStyle(color: AppColors.primary)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text('${subject.percentage.toInt()}%',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: progressColor)),
              const SizedBox(width: 12),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: subject.percentage / 100,
                    minHeight: 12,
                    backgroundColor: AppColors.background,
                    valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _stat('Total', subject.total.toString(), Colors.blue),
              _stat('Present', subject.present.toString(), AppColors.success),
              _stat('Absent', subject.absent.toString(), AppColors.error),
            ],
          ),
        ],
      ),
    );
  }

  Widget _stat(String label, String value, Color color) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label, style: TextStyle(color: color.withOpacity(0.8), fontSize: 12)),
      ],
    );
  }
}

// ============================================================
// ATTENDANCE DETAIL PAGE
// ============================================================

class AttendanceDetailPage extends StatelessWidget {
  final Subject subject;
  const AttendanceDetailPage({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History'), backgroundColor: Colors.transparent),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subject.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 4),
                Text(subject.faculty, style: const TextStyle(color: AppColors.textSecondary)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: subject.history.length,
              itemBuilder: (context, index) {
                final entry = subject.history[index];
                final bool isP = entry.status == 'P';
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(color: AppColors.background, shape: BoxShape.circle),
                        alignment: Alignment.center,
                        child: Text(entry.srNo.toString(), style: const TextStyle(color: AppColors.textSecondary)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(entry.date, style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text(entry.period, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isP ? AppColors.success.withOpacity(0.1) : AppColors.error.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          entry.status,
                          style: TextStyle(color: isP ? AppColors.success : AppColors.error, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SUBJECTS PAGE
// ============================================================

class SubjectsPage extends StatelessWidget {
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Subjects'), backgroundColor: Colors.transparent),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final s = subjects[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(16)),
                  child: Icon(s.type == 'Theory' ? Icons.book_rounded : Icons.biotech_rounded, color: AppColors.primary),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(s.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text(s.code, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                      const SizedBox(height: 2),
                      Text(s.faculty, style: const TextStyle(color: AppColors.primary, fontSize: 12)),
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
}

// ============================================================
// PROFILE PAGE
// ============================================================

class ProfilePage extends StatelessWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final String displayName = username.isNotEmpty
        ? '${username[0].toUpperCase()}${username.substring(1)}'
        : 'Student';

    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: 4),
                    ),
                    child: const CircleAvatar(
                      radius: 56,
                      backgroundColor: AppColors.surface,
                      child: Icon(Icons.person, size: 80, color: AppColors.primary),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                      child: const Icon(Icons.edit, size: 20, color: AppColors.background),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(displayName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('${username.toLowerCase()}@ves.edu.in', style: const TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 40),
            _profileItem(Icons.badge_outlined, 'Roll Number', '23'),
            _profileItem(Icons.school_outlined, 'Course', 'BCA - 2nd Year'),
            _profileItem(Icons.calendar_today_outlined, 'Academic Year', '2026-2027'),
            _profileItem(Icons.location_city_rounded, 'College', 'VES College of Arts, Science & Commerce'),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.error.withOpacity(0.5)),
              ),
              child: TextButton.icon(
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const LoginPage()), (route) => false),
                icon: const Icon(Icons.logout_rounded, color: AppColors.error),
                label: const Text('Sign Out', style: TextStyle(color: AppColors.error, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileItem(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                Text(value, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// TIMETABLE PAGE
// ============================================================

class TimeTablePage extends StatelessWidget {
  const TimeTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final timetable = [
      ['Monday', 'DS', 'MP', 'Hindi'],
      ['Tuesday', 'MPMC', 'DM', 'DS'],
      ['Wednesday', 'SE', 'MP', 'MPMC'],
      ['Thursday', 'Hindi', 'DS', 'DM'],
      ['Friday', 'OE', 'MPMC', 'SE'],
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Weekly Timetable'), backgroundColor: Colors.transparent),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: timetable.length,
        itemBuilder: (context, index) {
          final day = timetable[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(day[0], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _period('09:00', day[1]),
                    _period('10:00', day[2]),
                    _period('11:00', day[3]),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _period(String time, String subject) {
    return Column(
      children: [
        Text(time, style: const TextStyle(color: AppColors.textSecondary, fontSize: 11)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(12)),
          child: Text(subject, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        ),
      ],
    );
  }
}
