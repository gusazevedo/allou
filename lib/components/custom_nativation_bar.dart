import 'package:flutter/material.dart';

class CustomNativationBar extends StatelessWidget {
  final Function(int pageIndex) handleTabs;
  final int currentTabIndex;
  const CustomNativationBar({
    super.key,
    required this.handleTabs,
    required this.currentTabIndex,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentTabIndex,
      onDestinationSelected: handleTabs,
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.chat_bubble_outline),
          selectedIcon: Icon(Icons.chat_bubble),
          label: 'Chats',
        ),
        NavigationDestination(
          icon: Icon(Icons.group_outlined),
          selectedIcon: Icon(Icons.group),
          label: 'Team',
        ),
        NavigationDestination(
          icon: Icon(Icons.groups_outlined),
          selectedIcon: Icon(Icons.groups),
          label: 'Rooms',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
