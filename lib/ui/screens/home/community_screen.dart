import 'package:flutter/material.dart';
import 'package:todo_management/l10n/app_localizations.dart';
import 'package:todo_management/ui/widgets/all_widgets_file.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.communities,
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
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.people_alt,
                          color: Colors.grey[100],
                          size: 30,
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 15,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.add, color: Colors.black, size: 14),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    AppLocalizations.of(context)!.newCommunity,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Container(
              child: Row( spacing: 10,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 20, top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        "assets/letecodephoto.png",
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )

                  ,
                  Text(
                    "👨‍💻 Letecode community",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
