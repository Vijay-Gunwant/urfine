import 'package:flutter/material.dart';
import 'package:ur_fine/screens/settings.dart';
import 'package:ur_fine/screens/symptom_detection.dart';

import 'home.dart';
import 'medical_records.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;
  var items = const [Home(),MedicalRecords(),SymptomDetection(),Settings()];

  void _itemTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: items.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_customize_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload_outlined),
            label: 'Medical Records',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_off_outlined),
            label: 'Symptom Detection',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.tertiaryContainer,
        onTap: _itemTap,
      ),
    );
  }
}
