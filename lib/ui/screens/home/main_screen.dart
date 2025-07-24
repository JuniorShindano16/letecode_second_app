import 'package:flutter/material.dart';
import 'package:todo_management/l10n/app_localizations.dart';
import 'package:todo_management/ui/screens/home/calls_screen.dart';
import 'package:todo_management/ui/screens/home/community_screen.dart';
import 'package:todo_management/ui/screens/home/story_screen.dart';

import 'chat_screen.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {

  final pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.message),
        label: AppLocalizations.of(context)!.chats,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.update),
        label: AppLocalizations.of(context)!.updates,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.people_alt_outlined),
        label: AppLocalizations.of(context)!.communities,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.call),
        label: AppLocalizations.of(context)!.calls,
      ),
    ];

    List<Widget> screens = [
      ChatScreen(),
      StoryScreen(),
      CommunityScreen(),
      CallScreen(),
    ];



    return Scaffold(
      body: PageView(controller: pageController, children: screens),


      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        items: items,
      ),

    );
  }
}


/*bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(
          context,
        ).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: Theme.of(
          context,
        ).bottomNavigationBarTheme.unselectedItemColor,
        backgroundColor: Theme.of(
          context,
        ).bottomNavigationBarTheme.backgroundColor,
        selectedLabelStyle: Theme.of(context).textTheme.labelLarge,
        unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
        items: items,
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
      ),*/