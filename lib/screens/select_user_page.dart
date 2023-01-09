import 'package:flutter/material.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';
import '../models/demo_user.dart';
import 'home_page.dart';
import 'package:activity_feed/models/user_tile.dart';

/// Page to select from connect as one of the [DemoUser]s.
class SelectUserPage extends StatelessWidget {
  const SelectUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select user')),
      body: ListView(
        children: demoUsers
            .map(
              (demoUser) => UserTile(
            user: demoUser.user,
            onTap: () async {
              try {
                await context.feedClient
                    .setUser(demoUser.user, demoUser.token);
                await context.feedBloc.followFeed(
                  followerFeedGroup: 'timeline',
                  followeeFeedGroup: 'user',
                  followeeId: demoUser.user.id!,
                );

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const HomePage(),
                  ),
                );
              } on Exception catch (e, st) {
                debugPrintStack(stackTrace: st);
              }
            },
          ),
        )
            .toList(),
      ),
    );
  }
}






