import 'dart:math';

import 'package:expense_tracker/screens/add_expense/views/add_expense_screen.dart';
import 'package:expense_tracker/screens/home/views/main_screen.dart';
import 'package:expense_tracker/screens/stat/views/stat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;
  Color selectedItemColor = Colors.blue;
  Color unselectedItemColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              screenIndex = value;
            });
          },
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 3,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home, color: screenIndex == 0 ? selectedItemColor : unselectedItemColor),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.graph_square_fill,
                  color: screenIndex == 1 ? selectedItemColor : unselectedItemColor),
              label: 'Stats',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddExpenseScreen(),
          ));
        },
        shape: const CircleBorder(),
        child: Container(
            width: 56.0,
            height: 56.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                transform: const GradientRotation(pi / 4),
                colors: [
                  colorTheme.tertiary,
                  colorTheme.secondary,
                  colorTheme.primary,
                ],
              ),
            ),
            child: const Icon(CupertinoIcons.add)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: screenIndex == 0 ? MainScreen() : StatScreen(),
    );
  }
}
