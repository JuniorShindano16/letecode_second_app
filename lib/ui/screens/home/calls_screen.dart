import 'package:flutter/material.dart';
import 'package:todo_management/l10n/app_localizations.dart';
import 'package:todo_management/ui/widgets/all_widgets_file.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);
  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.calls,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 10,
            children: [
              Text("Favourites", style: Theme.of(context).textTheme.titleLarge,),
              Row(spacing: 10,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green
                    ), child: Icon(Icons.favorite, color: Colors.black, size: 20,),
                  ), Text(AppLocalizations.of(context)!.addFavourite, style: Theme.of(context).textTheme.titleMedium,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
