import 'package:chat_app/screens/home/widgets/left_panel.dart';
import 'package:chat_app/screens/home/widgets/right_panel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      body: Row(
        children: [
          SizedBox(
            width: 80,
            child: LeftPanel(
              selectedIndex: selectedIndex,
              onItemSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
                child: RightPanel(selectedIndex: selectedIndex),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
