import 'package:allou/components/custom_nativation_bar.dart';
import 'package:allou/pages/chats.dart';
import 'package:allou/pages/rooms.dart';
import 'package:allou/pages/settings.dart';
import 'package:allou/pages/team.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  void handleSwitchTab(int pageIndex) {
    setState(() {
      currentPageIndex = pageIndex;
    });
  }

  List<Widget> pageList = [
    ChatsPage(),
    TeamPage(),
    RoomsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentPageIndex, children: pageList),
      bottomNavigationBar: CustomNativationBar(
        currentTabIndex: currentPageIndex,
        handleTabs: handleSwitchTab,
      ),
    );
  }
}
