import 'package:flutter/material.dart';
import 'package:ipl_app/screens/my_team_screen.dart';
import 'package:ipl_app/screens/teams_screen.dart';
import '../widgets/app_drawer.dart';
import '../models/player.dart';

class TabsScreen extends StatefulWidget {
  final List<Player> myTeam;

  TabsScreen(this.myTeam);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': TeamsScreen(),
        'title': 'Teams',
      },
      {
        'page': MyTeamScreen(widget.myTeam),
        'title': 'My Team',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: "Teams",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grade),
            label: "My Team",
          ),
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}
