import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_animated_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          backgroundColor: Colors.black,
          body: ListView(children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Container(
                        width: 1000,
                        child: MarkdownBody(
                          styleSheet: MarkdownStyleSheet(
                            p: TextStyle(color: Colors.white, fontSize: 16),
                            h1: TextStyle(color: Colors.white, fontSize: 52),
                          ),
                          data: '''# (Kinda) Rich Animation Demo

This is a demo I've built within a fixed time frame of three hours. I tried reproducing
the animations found on [http://www.museapp.com](http://www.museapp.com) with Flutter.

In my first approach I tried using the staggered animations package but it did not give me
enough control over when to do what. So I decided to write my own animation controller
which works but probably needs still some love to be viable.

I also added a simple responsive Widget that accepts widgets for different container sizes,
although it is probably not optimal yet.

You can find the code for this example at [http://github.com/MaximilianKlein/flutter_keyframe_animation_example](http://github.com/MaximilianKlein/flutter_keyframe_animation_example).
''',
                          onTapLink: (_, url, __) => launch(url!),
                        )))),
            Padding(
                child: Center(
                    child: Container(
                        width: 1000,
                        color: Colors.white,
                        child: CustomAnimatedList())),
                padding: EdgeInsets.all(20)),
          ])),
    );
  }
}
