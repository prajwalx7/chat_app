import 'package:chat_app/screens/chat_list/view/chat_list_screen.dart';
import 'package:chat_app/screens/group_list_screen.dart';
import 'package:chat_app/screens/profile_screen.dart';
import 'package:chat_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class RightPanel extends StatelessWidget {
  final int selectedIndex;
  const RightPanel({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return ChatListScreen();
      case 1:
        return GroupListScreen();
      case 2:
        return ProfileScreen();
      case 3:
        return SettingsScreen();
      default:
        return Center(child: Text('Select a section'));
    }
  }
}
