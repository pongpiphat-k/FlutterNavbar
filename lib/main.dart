import 'package:flutter/material.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Navigation());
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromARGB(255, 234, 192, 66),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon( Icons.settings),
            label: 'Settings',
          ),
         
        ],
      ),
      body: <Widget>[
        /// Home page
        Card(
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(child: Text('Home page', style: theme.textTheme.titleLarge)),
          ),
        ),
        Card(
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(child: Text('Settings page', style: theme.textTheme.titleLarge)),
          ),
        ),
      
       
      ][currentPageIndex],
    );
  }
}