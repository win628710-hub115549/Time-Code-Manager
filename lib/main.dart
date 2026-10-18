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

// ================= HOME SCREEN =================
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
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
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

// ================= DASHBOARD TAB =================
class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        _buildMenuCard(
          context,
          icon: Icons.style,
          title: 'Voucher Manager',
          subtitle: 'Voucher Code များ Print ထုတ်ရန်',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const VoucherManagerScreen())),
        ),
        _buildMenuCard(
          context,
          icon: Icons.devices,
          title: 'Connected Devices',
          subtitle: 'ချိတ်ထားသော ဖုန်းများကိုကြည့်ရန်',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ConnectedDevicesScreen())),
        ),
        _buildMenuCard(
          context,
          icon: Icons.block,
          title: 'BlackList Devices',
          subtitle: 'Blacklist လုပ်ထားသော ဖုန်းများ',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BlacklistScreen())),
        ),
        _buildMenuCard(
          context,
          icon: Icons.pie_chart,
          title: 'Project Overview',
          subtitle: 'Project အချက်အလက်များစစ်ရန်',
          onTap: () {},
        ),
        _buildMenuCard(
          context,
          icon: Icons.settings,
          title: 'Print Settings',
          subtitle: 'Printer : Unlimited (Style ရွေးရန်)',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PrintSettingsScreen())),
        ),
        _buildMenuCard(
          context,
          icon: Icons.info_outline,
          title: 'Contact',
          subtitle: 'ဆက်သွယ်ရန် | version : 2.6h',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactScreen())),
        ),
      ],
    );
  }

  Widget _buildMenuCard(BuildContext context, {required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return Card(
      color: const Color(0xFF1E1E1E),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}

// ================= VOUCHER MANAGER SCREEN =================
class VoucherManagerScreen extends StatefulWidget {
  const VoucherManagerScreen({super.key});

  @override
  State<VoucherManagerScreen> createState() => _VoucherManagerScreenState();
}

class _VoucherManagerScreenState extends State<VoucherManagerScreen> {
  String selectedFilter = 'မသုံးရသေးသောကုဒ်များ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Voucher Manager')),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: [Text('စုစုပေါင်း', style: TextStyle(color: Colors.white70)), Text('1389', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))]),
                Column(children: [Text('သုံးနေသောကုဒ်', style: TextStyle(color: Colors.white70)), Text('8', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))]),
                Column(children: [Text('သက်တမ်းကုန်', style: TextStyle(color: Colors.white70)), Text('0', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(8)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedFilter,
                        dropdownColor: const Color(0xFF1E1E1E),
                        style: const TextStyle(color: Colors.white),
                        items: ['မသုံးရသေးသောကုဒ်များ', 'သုံးနေသောကုဒ်များ', 'သုံးပြီးသားကုဒ်များ']
                            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (val) => setState(() => selectedFilter = val!),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(icon: const Icon(Icons.add_box, color: Colors.blue), onPressed: () {}),
                IconButton(icon: const Icon(Icons.print, color: Colors.blue), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(8)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('218565570', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                          SizedBox(height: 4),
                          Text('3gb', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      Icon(Icons.print, color: Colors.blue),
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

// ================= CONNECTED DEVICES SCREEN =================
class ConnectedDevicesScreen extends StatelessWidget {
  const ConnectedDevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connected Devices'), actions: [TextButton(onPressed: () {}, child: const Text('Refresh', style: TextStyle(color: Colors.white)))]),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total Devices : 8  |  Wifi : 8  |  Wired : 0', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(8)),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('vivo Y19s  ↓ 35 MB', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                          Text('146011232', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text('📶 Zayar Win ( Ruijie )', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text('5A:64:34:07:22:1E', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text('192.168.61.166', style: TextStyle(color: Colors.grey, fontSize: 12)),
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

// ================= BLACKLIST SCREEN =================
class BlacklistScreen extends StatelessWidget {
  const BlacklistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BlackList Devices')),
      body: const Center(
        child: Text('Black List လုပ်ထားသော Device များ မရှိသေးပါ။', style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}

// ================= PRINT SETTINGS SCREEN =================
class PrintSettingsScreen extends StatefulWidget {
  const PrintSettingsScreen({super.key});

  @override
  State<PrintSettingsScreen> createState() => _PrintSettingsScreenState();
}

class _PrintSettingsScreenState extends State<PrintSettingsScreen> {
  int selectedStyle = 1;
  final TextEditingController wifiNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Print Settings')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          TextField(
            controller: wifiNameController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Wifi Name',
              hintText: 'Wifi အမည် ရိုက်ထည့်ပါ',
              labelStyle: TextStyle(color: Colors.grey),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            ),
          ),
          const SizedBox(height: 20),
          _buildStyleRadio(1, 'TwoHours: 4i7ni7'),
          _buildStyleRadio(2, 'wifi : Public Wifi\nprofile : onehour\nvoucher : ae1xjz'),
          _buildStyleRadio(3, 'Ruijie\n- 30minute -\n017866'),
          _buildStyleRadio(4, 'wifi name : wifi\nprofile : 100MB\ndata : 100 MB\nvoucher : 117317'),
          _buildStyleRadio(5, 'Style 1 Plus'),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, padding: const EdgeInsets.all(14)),
            onPressed: () {},
            child: const Text('Save Setting', style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _buildStyleRadio(int value, String previewText) {
    return RadioListTile<int>(
      value: value,
      groupValue: selectedStyle,
      activeColor: Colors.blue,
      title: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Text(previewText, style: const TextStyle(color: Colors.black, fontFamily: 'monospace', fontSize: 12)),
      ),
      onChanged: (val) => setState(() => selectedStyle = val!),
    );
  }
}

// ================= FREE SVIP TAB =================
class FreeSvipTab extends StatelessWidget {
  const FreeSvipTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text('Voucher section', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
        ),
        _buildFreeFeatureCard(
          icon: Icons.delete_sweep,
          title: 'Delete Expired Codes',
          subtitle: 'Expired Code အရေအတွက် ၁၀၀၀ ဖျက်ရန်',
          onTap: () => _showFreeSnackbar(context, 'Expired Codes များကို ဖျက်ပြီးပါပြီ'),
        ),
        _buildFreeFeatureCard(
          icon: Icons.remove_circle_outline,
          title: 'Delete Unused Codes',
          subtitle: 'မသုံးရသေးသော code များကို ဖျက်ရန်',
          onTap: () => _showFreeSnackbar(context, 'Unused Codes များကို ဖျက်ပြီးပါပြီ'),
        ),
        _buildFreeFeatureCard(
          icon: Icons.people,
          title: 'Auth Clients',
          subtitle: 'သုံးနေသော code များကို ကြည့်ရန်/ထုတ်ရန်',
          onTap: () => _showFreeSnackbar(context, 'Auth Clients သို့ ဝင်ရောက်ပြီးပါပြီ'),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text('Blocking Section', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
        ),
        _buildFreeFeatureCard(
          icon: Icons.block,
          title: 'Block Gambling Sites',
          subtitle: 'လောင်းကစားဂိမ်း/Website များကို block ရန်',
          onTap: () => _showFreeSnackbar(context, 'Gambling Sites များကို Block လိုက်ပါပြီ'),
        ),
        _buildFreeFeatureCard(
          icon: Icons.restart_alt,
          title: 'Starlink Reboot Fix',
          subtitle: 'Starlink Shutdown ပိတ်ခံရခြင်းကို ကာကွယ်ရန်',
          onTap: () => _showFreeSnackbar(context, 'Starlink Reboot Fix ကို ဖွင့်ပြီးပါပြီ'),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text('Device section & Utility', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
        ),
        _buildFreeFeatureCard(
          icon: Icons.security,
          title: 'HTTP injection attack prevention',
          subtitle: 'VPN ကျော်သုံးစွဲခြင်းကို ကာကွယ်ရန်',
          onTap: () => _showFreeSnackbar(context, 'HTTP Injection Protection ဖွင့်ပြီးပါပြီ'),
        ),
        _buildFreeFeatureCard(
          icon: Icons.security_outlined,
          title: 'DSNTT VPN Block',
          subtitle: 'Slowdns VPN ကျော်သုံးမရအောင်ပိတ်ရန်',
          onTap: () => _showFreeSnackbar(context, 'DSNTT VPN Block ဖွင့်ပြီးပါပြီ'),
        ),
        _buildFreeFeatureCard(
          icon: Icons.router,
          title: 'MAC Allow List',
          subtitle: 'Mac Allow List ထဲ AP/Router များထည့်ရန်',
          onTap: () => _showFreeSnackbar(context, 'MAC Allow List သို့ ဝင်ရောက်ပြီးပါပြီ'),
        ),
        _buildFreeFeatureCard(
          icon: Icons.wifi_tethering_off,
          title: 'Block Hotspot (FREE)',
          subtitle: 'Hotspot sharing ကို TTL rule ဖြင့် block ရန်',
          onTap: () => _showFreeSnackbar(context, 'Hotspot Sharing ကို Block ပြီးပါပြီ'),
        ),
        _buildFreeFeatureCard(
          icon: Icons.search,
          title: 'One-Click Finder',
          subtitle: 'Oneclick Method နဲ့သုံးနေတာကိုရှာရန်',
          onTap: () => _showFreeSnackbar(context, 'One-Click Finder ကို စတင်နေပါပြီ'),
        ),
        _buildFreeFeatureCard(
          icon: Icons.bar_chart,
          title: 'Top Traffic Devices',
          subtitle: 'MB/GB အသုံးများဆုံး device များကိုကြည့်ရန်',
          onTap: () => _showFreeSnackbar(context, 'Top Traffic Devices စာရင်းကို ဖွင့်လိုက်ပါပြီ'),
        ),
        _buildFreeFeatureCard(
          icon: Icons.block,
          title: 'Restricted Devices',
          subtitle: 'Restrict လုပ်ထားသော devices များ',
          onTap: () => _showFreeSnackbar(context, 'Restricted Devices စာရင်းသို့ ဝင်ရောက်ပြီးပါပြီ'),
        ),
        _buildFreeFeatureCard(
          icon: Icons.timer,
          title: 'Client Sync Interval',
          subtitle: 'Router ၏ client sync interval ကိုပြင်ရန်',
          onTap: () => _showFreeSnackbar(context, 'Client Sync Interval ဆက်တင်သို့ ဝင်ရောက်ပြီးပါပြီ'),
        ),
      ],
    );
  }

  Widget _buildFreeFeatureCard({required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return Card(
      color: const Color(0xFF1E1E1E),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 11)),
        trailing: const Icon(Icons.check_circle, color: Colors.green, size: 20),
        onTap: onTap,
      ),
    );
  }

  void _showFreeSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.blue,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

// ================= CONTACT SCREEN =================
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us')),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Text('Time Code Manager', style: TextStyle(color: Colors.blue, fontSize: 22, fontWeight: FontWeight.bold)),
          const Text('Version : 2.6h', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 40),
          ListTile(title: const Text('App အသုံးပြုနည်း Guide များ ကြည့်ရန်', style: TextStyle(color: Colors.white)), trailing: const Icon(Icons.chevron_right, color: Colors.grey), onTap: () {}),
          ListTile(title: const Text('Facebook စာမျက်နှာသို့', style: TextStyle(color: Colors.white)), trailing: const Icon(Icons.chevron_right, color: Colors.grey), onTap: () {}),
          ListTile(title: const Text('Telegram Channel သို့', style: TextStyle(color: Colors.white)), trailing: const Icon(Icons.chevron_right, color: Colors.grey), onTap: () {}),
        ],
      ),
    );
  }
}
