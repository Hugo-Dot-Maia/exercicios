import 'package:exercicios/menuBottomNavigation/welcome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuBottomNavigationWidget extends StatefulWidget {
  const MenuBottomNavigationWidget({super.key});

  @override
  _MenuBottomNavigationWidgetState createState() =>
      _MenuBottomNavigationWidgetState();
}

class _MenuBottomNavigationWidgetState extends State<MenuBottomNavigationWidget> {
  int _selectedIndex = 0;
  late SharedPreferences prefs;
  late String? name;

  @override
  Future<void> initState() async {
    super.initState();
    prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation'),
      ),
      body: Center(
        child: _getPage(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return WelcomeScreen(username: name);
      case 1:
        return SearchScreen();
      case 2:
        return ProfileScreen();
      default:
        return HomeScreen();
    }
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Screen'),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Search Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Screen'),
    );
  }
}
