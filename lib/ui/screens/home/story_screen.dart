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
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.updates,
              style: Theme.of(context).textTheme.titleLarge,
            ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text("Status", style: Theme.of(context).textTheme.titleMedium),
              ItemStoryWidget(
                path: "assets/eminem.jpg",
                name: AppLocalizations.of(context)!.myStatus,
                time: 3,
              ),

              Text(
                AppLocalizations.of(context)!.recentUpdates,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              ItemStoryWidget(
                path: "assets/eminem.jpg",
                name: AppLocalizations.of(context)!.myStatus,
                time: 1,
              ),

              Row(
                children: [
                  Text(
                    "Show muted",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _visible = !_visible;
                      });
                    },
                    icon: Icon(
                      _visible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0,
                    duration: Duration(milliseconds: 400),
                    child:  ItemStoryWidget(
                      path: "assets/letecodephoto.png",
                      name: AppLocalizations.of(context)!.myStatus,
                      time: 1,
                    ) ,
                  ),
                  AnimatedScale(
                    scale: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 400),
                    child: ItemStoryWidget(
                      path: "assets/letecodephoto.png",
                      name: AppLocalizations.of(context)!.myStatus,
                      time: 1,
                    ),
                  ),
                  AnimatedSlide(
                    offset: _visible ? Offset(0, 0) : Offset(1, 0),
                    duration: const Duration(milliseconds: 400),
                    child: ItemStoryWidget(
                      path: "assets/letecodephoto.png",
                      name: AppLocalizations.of(context)!.myStatus,
                      time: 1,
                    ),
                  ),AnimatedAlign(
                    alignment: _visible ? Alignment.center : Alignment.topRight,
                    duration: const Duration(milliseconds: 400),
                    child: ItemStoryWidget(
                      path: "assets/letecodephoto.png",
                      name: AppLocalizations.of(context)!.myStatus,
                      time: 1,
                    ),
                  ),AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: _visible ? 100 : 0,
                    curve: Curves.easeInOut,
                    child: ItemStoryWidget(
                      path: "assets/letecodephoto.png",
                      name: AppLocalizations.of(context)!.myStatus,
                      time: 1,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
