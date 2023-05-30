import 'package:exercicios/telaDeLogin/login.dart';
import 'package:exercicios/telaDeLogin/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'CRUD/crud.dart';
import 'itemListAlert/item_list_page.dart';
import 'menuBottomNavigation/menu_bottom_navigation.dart';

void main() async {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  runApp(const ExerciseHubApp());
}



class ExerciseHubApp extends StatelessWidget {
  const ExerciseHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise Hub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/exercise1': (context) => const RegistrationScreen(),
        '/exercise2': (context) => LoginWidget(),
        '/exercise3': (context) => const MenuBottomNavigationWidget(),
        '/exercise4': (context) => ItemListPage(),
        '/exercise5': (context) => const DatabaseExampleWidget(),

        // Add more routes for other exercises
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Hub'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/exercise1');
              },
              child: const Text('Exercício Tela de signUp'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/exercise2');
              },
              child: const Text('Exercício Tela de Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/exercise3');
              },
              child: const Text('Exercício Menu Bottom Navigation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/exercise4');
              },
              child: const Text('Exercício Lista Item Alert'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/exercise5');
              },
              child: const Text('CRUD'),
            ),
            // Add more buttons for other exercises
          ],
        ),
      ),
    );
  }
}
