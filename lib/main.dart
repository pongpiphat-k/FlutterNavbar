import 'package:flutter/material.dart';
void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Navigation',
      home: Navigation());
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationBar();
}

class _NavigationBar extends State<Navigation> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Scaffold(
              bottomNavigationBar: NavigationBar(
                onDestinationSelected: (int index) {
                  setState(() {
            currentPageIndex = index;
           });
            },
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
             body: <Widget> [
               Center(
                child: Text('Home Page'),
              ),
               Center(
                child: Text('Settings Page'),
               ),
            ][currentPageIndex]
             );
              }

           return Row(
            children: <Widget>[
              NavigationRail(
                onDestinationSelected: (int index) {
                  setState(() {
                    currentPageIndex = index;
                  });
                },
                selectedIndex: currentPageIndex,
                destinations: const <NavigationRailDestination>[
                  NavigationRailDestination(
                    icon: Icon(Icons.home_outlined), 
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings), 
                    label: Text('Settings'),
                  ),
                ],
              ),
              const VerticalDivider(thickness: 1, width: 1),
            Expanded(
                child: [
                  Center(
                    child: Text('Home Page'),
                  ),
                  Center(
                    child: Text('Settings Page'),
                  ),
                ][currentPageIndex],
              ),
            ]
          );
        },
      ), 
    );
  }
}