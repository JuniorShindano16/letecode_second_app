import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_management/ui/widgets/all_widgets_file.dart';
import 'package:todo_management/ui/widgets/discussion_bulle_widget.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  bool _visible = false;
  Map<String, dynamic>? _selectedMessage;
  TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [
    {
      'message': 'Salut ! Tu vas bien ?',
      'time': '10:01',
      'isSender': true,
      'received': true,
      'read': true,
    },
    {'message': 'Oui et toi ?', 'time': '10:02', 'isSender': false},
    {
      'message': 'Je vais bien aussi !',
      'time': '10:03',
      'isSender': true,
      'received': true,
      'read': true,
    },
    {
      'message': 'Tu fais quoi ce soir ?',
      'time': '10:04',
      'isSender': true,
      'received': true,
      'read': true,
    },
    {
      'message': 'Rien de spécial. Pourquoi ?',
      'time': '10:05',
      'isSender': false,
    },
    {
      'message': 'On peut sortir si tu veux.',
      'time': '10:06',
      'isSender': true,
      'received': true,
      'read': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconForAppBar(Icons.videocam_outlined, context),
          SizedBox(width: 5),
          IconForAppBar(Icons.call_outlined, context),
          SizedBox(width: 5),
          IconForAppBar(Icons.more_vert_outlined, context),
        ],
        title: Row(

          spacing : 10,
          children: [
            ClipOval(
              child: Image.asset(
                "assets/eminem.jpg",
                width: 35,
                height: 35,
                fit: BoxFit.cover,
              ),
            ),
            Text("Eminem", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final data = messages[index];
                      return LongPressDraggable(
                        feedback: Material(
                          color: Colors.transparent,
                          child: DiscussionBulleWidget(
                            message: data['message'],
                            time: data['time'],
                            isSender: data['isSender'],
                            received: data['received'],
                            read: data['read'],
                          ),
                        ),
                        childWhenDragging: Opacity(
                          opacity: 0.3,
                          child: DiscussionBulleWidget(
                            message: data['message'],
                            time: data['time'],
                            isSender: data['isSender'],
                            received: data['received'],
                            read: data['read'],
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _visible = !_visible;
                              _selectedMessage = data;
                            });
                          },
                          child: DiscussionBulleWidget(
                            message: data['message'],
                            time: data['time'],
                            isSender: data['isSender'],
                            received: data['received'],
                            read: data['read'],
                          ),
                        ),
                      );
                    }, childCount: messages.length),
                  ),
                ),
                SliverToBoxAdapter(
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0,
                    duration: Duration(milliseconds: 400),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Message : ",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                Expanded(
                                  child: Text(
                                    "${_selectedMessage?['message'] ?? 'No message selected'}",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Status : ",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                Text(
                                  "${_selectedMessage?['read'] == true ? "Yes" : "No"}",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).dividerColor,
                          width: 0.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.emoji_emotions_outlined,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              style: Theme.of(context).textTheme.labelMedium,
                              onChanged: (value) {
                                setState(() {
                                  _controller;
                                });
                              },
                              controller: _controller,
                              decoration: InputDecoration(
                                hintStyle: Theme.of(
                                  context,
                                ).textTheme.labelSmall,
                                hintText: 'Message...',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                              ),
                              maxLines: null,
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      shape: BoxShape.circle,
                    ),
                    child: _controller.text == ""
                        ? IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.mic,
                              color: Theme.of(context).colorScheme.onSurface,
                              size: 20,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              var text = _controller.text;
                              Map<String, dynamic> newMessage ;
                              final now = TimeOfDay.fromDateTime(DateTime.now());
                              final formattedTime = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
                              newMessage = {
                                'message': text,
                                'time': formattedTime.toString(),
                                'isSender': true,
                                'received': false,
                                'read': false,
                              };

                              if (kDebugMode) {
                                print (newMessage);
                              }
                              setState(() {
                                messages.add(newMessage);
                                _controller.text = "";
                              });
                            },
                            icon: Icon(
                              Icons.send,
                              color: Theme.of(context).colorScheme.onSurface,
                              size: 20,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
