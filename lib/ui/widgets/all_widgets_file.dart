import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:todo_management/l10n/app_localizations.dart';

Widget IconForAppBar(IconData ico, BuildContext context) {
  return Icon(ico, color: Theme.of(context).iconTheme.color);
}

Widget ListTileChats({
  required String path,
  required String name,
  required bool received,
  required bool read,
  required String message,
  required String date,
  required int count,
  required BuildContext context,
}) {
  return ListTile(
    leading: ClipOval(
      child: Image.asset("$path", width: 50, height: 50, fit: BoxFit.cover),
    ),
    title: Text("$name", style: Theme.of(context).textTheme.titleMedium),
    subtitle: Row(
      spacing: 5,
      children: [
        Icon(
          received
              ? MaterialCommunityIcons.check_all
              : MaterialCommunityIcons.check,
          color: read ? Colors.blue : Colors.grey,
          size: 18,
        ),

        Expanded(child: Text("$message", overflow: TextOverflow.ellipsis)),
      ],
    ),
    trailing: Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(date, style: TextStyle(fontSize: 12)),

        Row(
          spacing: 4,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  "$count",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget ListTileChatsPinned({
  required String path,
  required String name,
  required bool received,
  required bool read,
  required String message,
  required String date,
  required int count,
  required BuildContext context,
}) {
  return ListTile(
    leading: ClipOval(
      child: Image.asset("$path", width: 50, height: 50, fit: BoxFit.cover),
    ),
    title: Text("$name", style: Theme.of(context).textTheme.titleMedium),
    subtitle: Row(
      spacing: 5,
      children: [
        Icon(
          received
              ? MaterialCommunityIcons.check_all
              : MaterialCommunityIcons.check,
          color: read ? Colors.blue : Colors.grey,
          size: 18,
        ),

        Expanded(child: Text("$message", overflow: TextOverflow.ellipsis)),
      ],
    ),
    trailing: Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(date, style: TextStyle(fontSize: 12)),

        Row(
          spacing: 4,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  "$count",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Icon(Icons.push_pin, size: 18, color: Colors.grey),
          ],
        ),
      ],
    ),
  );
}

Widget StoryItem({
  required String path,
  required String name,
  required int time,
  required BuildContext context,
}) {
  return Row(
    spacing: 10,
    children: [
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
          border: Border.all(color: Colors.grey, style: BorderStyle.solid),
        ),
        child: ClipOval(
          child: Image.asset("$path", width: 60, height: 60, fit: BoxFit.cover),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: Theme.of(context).textTheme.titleMedium),
          Text(AppLocalizations.of(context)!.minutesCount(time)),
        ],
      ),
    ],
  );
}
