import 'package:flutter/material.dart';
import 'package:todo_management/l10n/app_localizations.dart';

class ItemStoryWidget extends StatelessWidget {
  final String path;
  final String name;
  final int time;
  const ItemStoryWidget({
    required this.path,
    required this.name,
  required this.time,
    super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Image.asset(path, width: 60, height: 60, fit: BoxFit.cover),
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
}
