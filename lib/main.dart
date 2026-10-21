import 'package:flutter/material.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';

void main() {
  runApp(const TimeCodeManagerApp());
}

class TimeCodeManagerApp extends StatelessWidget {
  const TimeCodeManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Code Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.blue,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Project Name', style: TextStyle(color: Colors.white70, fontSize: 12)),
                SizedBox(height: 4),
                Text('Starlink', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            color: const Color(0xFF1E1E1E),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabButton('Home', 0),
                _buildTabButton('SVIP (Free)', 1),
                _buildTabButton('Bill ဆောင်ရန်', 2),
              ],
            ),
          ),
          Expanded(
            child: _currentIndex == 0
                ? const DashboardTab()
                : _currentIndex == 1
                    ? const FreeSvipTab()
                    : const Center(child: Text('Bill ဆောင်ရန်', style: TextStyle(fontSize: 20))),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    bool isSelected = _currentIndex == index;
    return TextButton(
      onPressed: () => setState(() => _currentIndex = index),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        _buildMenuCard(context, icon: Icons.style, title: 'Voucher Manager', subtitle: 'Voucher Code များ Print ထုတ်ရန်', onTap: () {}),
        _buildMenuCard(context, icon: Icons.devices, title: 'Connected Devices', subtitle: 'ချိတ်ထားသော ဖုန်းများကိုကြည့်ရန်', onTap: () {}),
      ],
    );
  }

  Widget _buildMenuCard(BuildContext context, {required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return Card(
      color: const Color(0xFF1E1E1E),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        onTap: onTap,
      ),
    );
  }
}

class FreeSvipTab extends StatelessWidget {
  const FreeSvipTab({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Free SVIP Section', style: TextStyle(color: Colors.white)));
  }
}

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Contact', style: TextStyle(color: Colors.white)));
  }
}
