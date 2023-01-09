import 'package:flutter/material.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';
import 'screens/select_user_page.dart';


Future<void> main() async {
  const apiKey = 'q29npdvqjr99'; // TODO: Replace with your key
  final client = StreamFeedClient(apiKey);

  runApp(
    MyApp(client: client),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.client,
  }) : super(key: key);

  final StreamFeedClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => FeedProvider(
        bloc: FeedBloc(
          client: client,
        ),
        child: child!,
      ),
      home: const SelectUserPage(),
    );
  }
}


