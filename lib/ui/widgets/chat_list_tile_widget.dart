import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ChatListTileWidget extends StatelessWidget {
  final String path;
  final String name;
  final bool received;
  final bool read;
  final String message;
  final String date;
  final int count;
  final bool pinned;

  const ChatListTileWidget({
    required this.name,
    required this.path,
    required this.message,
    required this.count,
    required this.received,
    required this.read,
    required this.date,
    required this.pinned,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              ), pinned ? Icon(Icons.push_pin, size: 18, color: Colors.grey) : SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
