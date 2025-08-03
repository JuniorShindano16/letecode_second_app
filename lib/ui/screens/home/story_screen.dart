

import 'package:flutter/material.dart';
import 'package:todo_management/l10n/app_localizations.dart';
import 'package:todo_management/ui/widgets/all_widgets_file.dart';
import 'package:todo_management/ui/widgets/item_story_widget.dart';


class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppLocalizations.of(context)!.updates, style: Theme.of(context).textTheme.titleLarge),
          Row(
            spacing: 10,
            children: [
              IconForAppBar(Icons.search, context),
              IconForAppBar(Icons.more_vert_outlined, context),
            ],
          ),
        ],
      ),

    ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 10,
            children: [
              Text("Status", style: Theme.of(context).textTheme.titleMedium,),
              ItemStoryWidget(path: "assets/eminem.jpg", name: AppLocalizations.of(context)!.myStatus, time: 3),

              Text(AppLocalizations.of(context)!.recentUpdates, style: Theme.of(context).textTheme.titleSmall,),
              ItemStoryWidget(path: "assets/eminem.jpg", name: AppLocalizations.of(context)!.myStatus, time: 1),
            ],
          ),
        ),
      ),
    );
  }
}
