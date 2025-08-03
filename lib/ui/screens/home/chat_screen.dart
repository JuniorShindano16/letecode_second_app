import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:todo_management/l10n/app_localizations.dart';
import 'package:todo_management/ui/screens/home/conversation_screen.dart';
import 'package:todo_management/ui/widgets/all_widgets_file.dart';
import 'package:todo_management/ui/widgets/chat_list_tile_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String selectedFilterKey = 'filterAll';

  final List<String> filterKeys = [
    "filterAll",
    "filterUnread",
    "filterFavourites",
    "filterGroups",
  ];

  String getTranslatedLabel(BuildContext context, String key) {
    final loc = AppLocalizations.of(context)!;
    switch (key) {
      case 'filterGroups':
        return loc.filterGroups;
      case 'filterUnread':
        return loc.filterUnread;
      case 'filterFavourites':
        return loc.filterFavourites;
      case 'filterAll':
      default:
        return loc.filterAll;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconForAppBar(Icons.photo_camera_outlined, context),
          IconForAppBar(Icons.search, context),
          IconForAppBar(Icons.more_vert_outlined, context),
        ],
        title: Text("Sema", style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            SizedBox(height: 20),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filterKeys.length,
                itemBuilder: (context, index) {
                  String key = filterKeys[index];
                  final isSelected = key == selectedFilterKey;
                  return GestureDetector(
                    onTap: () {
                      print(getTranslatedLabel(context, key));
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.green[100]
                            : Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Text(
                        getTranslatedLabel(context, key),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                spacing: 20,
                children: [
                  Icon(Icons.archive_outlined, size: 25, color: Colors.grey),
                  Text(
                    AppLocalizations.of(context)!.archived,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            GestureDetector(onTap: (){

              Navigator.of(context).push(_createRoute());

            },
              child: ChatListTileWidget(pinned: true,
                count: 3,
                date: AppLocalizations.of(context)!.yesterday,
                message: "Tu ne réponds pas pourquoi",
                name: "Eminem 😎",
                path: "assets/eminem.jpg",
                read: false,
                received: true,
              ),
            ),
            ChatListTileWidget(
              name: 'Eminem 😎',
              path: 'assets/eminem.jpg',
              message: 'Tu ne réponds pas pourquoi',
              count: 3,
              received: false,
              read: false,
              date: AppLocalizations.of(context)!.yesterday,
              pinned: false,
            ),

          ],
        ),
      ),
    );
  }


  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ConversationScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.bounceIn;
        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

        return SlideTransition(position: tween.animate(curvedAnimation), child: child);
      },
    );
  }
}
