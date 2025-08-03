import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class DiscussionBulleWidget extends StatefulWidget {
  final String message;
  final String time;
  final bool isSender;
  final bool? received;
  final bool? read;

  const DiscussionBulleWidget({
    required this.message,
    required this.time,
    required this.isSender,
    this.read,
    this.received,
    super.key,
  });

  @override
  State<DiscussionBulleWidget> createState() => _DiscussionBulleWidgetState();
}

class _DiscussionBulleWidgetState extends State<DiscussionBulleWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: widget.isSender
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(widget.isSender ? 16 : 0),
            bottomRight: Radius.circular(widget.isSender ? 0 : 16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 55),
              child: Text(
                widget.message,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                children: [
                  Text(
                    widget.time,
                    style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  ), SizedBox(width: 5,),  widget.isSender == true?
                  Icon(
                  widget.received == true
                        ? MaterialCommunityIcons.check_all
                        : MaterialCommunityIcons.check,
                    color:  widget.received == true && widget.read == true ? Colors.blue : Colors.grey,
                    size: 18,
                  ) : SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
