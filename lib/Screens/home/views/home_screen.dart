import 'package:expense_app/Screens/home/views/main_screen.dart';
import 'package:expense_app/Screens/stat/stat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var widgetList = [MainScreen(), StatScreen()];

  int index = 0;
  late Color selecteditem = Colors.blue;
  Color unselecteditem = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                index = value;
              });
              print(value);
            },

            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 3,
            //type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: 'Home',
                  backgroundColor: index == 0 ? selecteditem : unselecteditem),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.graph_square_fill),
                  label: "Status",
                  backgroundColor: index == 1 ? selecteditem : unselecteditem)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.tertiary
                  ],
                ),
              ),
              child: const Icon(CupertinoIcons.add)),
        ),
        body: index == 0 ? MainScreen() : StatScreen());
  }
}
