import 'package:basic_web_app/responsive.dart';
import 'package:basic_web_app/reveal_widget.dart';
import 'package:flutter/material.dart';

import 'animations/keyframe_animator.dart';
import 'animations/reveal_animation.dart';
import 'custom_app_bar.dart';

class CustomAnimatedList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomAnimatedListState();
}

class _CustomAnimatedListState extends State<CustomAnimatedList> {
  @override
  Widget build(BuildContext context) {
    final content = [
      CustomAppBar(),
      Padding(padding: EdgeInsets.only(top: 120)),
      Container(
          alignment: Alignment.centerLeft,
          child: RevealWidget(
            child: Chip(
              label: Text('New in here: Cool boards →'),
            ),
            key: Key('chip1'),
            revealType: RevealType.OnlyFade,
          )),
      RevealWidget(
        key: Key('heading'),
        child: Responsive(layouts: [
          ResponsiveLayout(
              constraint: upTo(580),
              builder: (_) => Text('Your tool for doing stuff!',
                  style: TextStyle(fontSize: 32))),
          ResponsiveLayout(
              constraint: catchAll(),
              builder: (_) => Text('Your tool for thought!',
                  style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold))),
        ]),
      ),
      Padding(padding: EdgeInsets.only(top: 10)),
      RevealWidget(
          key: Key('paragraph1'),
          child: Responsive(layouts: [
            ResponsiveLayout(
                constraint: upTo(580),
                builder: (_) => Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis iaculis augue. Ut in libero augue. Etiam sit amet lacus volutpat, suscipit arcu ac, interdum elit. In facilisis porta scelerisque. Nunc sem nulla, sagittis id maximus hendrerit, dignissim et sapien.',
                      textScaleFactor: 1,
                    )),
            ResponsiveLayout(
                constraint: catchAll(),
                builder: (_) => Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis iaculis augue. Ut in libero augue. Etiam sit amet lacus volutpat, suscipit arcu ac, interdum elit. In facilisis porta scelerisque. Nunc sem nulla, sagittis id maximus hendrerit, dignissim et sapien.',
                      textScaleFactor: 2,
                    )),
          ])),
      Padding(
        padding: EdgeInsets.only(top: 40),
      ),
      RevealWidget(
        key: Key('img1'),
        revealType: RevealType.ScaleIn,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network('https://picsum.photos/seed/img1/1000/562',
                fit: BoxFit.fill)),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10),
      ),
      RichText(
          text: TextSpan(text: '', children: [
        TextSpan(
            text: 'This is a content page.',
            style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(
            text:
                ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis iaculis augue.'),
      ])),
    ];
    return Padding(
        padding: EdgeInsets.all(20),
        child: KeyframeAnimator(
            keyframes: [
              Keyframe(
                key: Key('heading'),
                duration: Duration(milliseconds: 800),
                triggerOffset: Duration(milliseconds: 100),
              ),
              Keyframe(
                key: Key('paragraph1'),
                duration: Duration(milliseconds: 800),
                triggerOffset: Duration(milliseconds: 500),
              ),
              Keyframe(
                key: Key('chip1'),
                duration: Duration(milliseconds: 800),
                triggerOffset: Duration(milliseconds: 1000),
              ),
              Keyframe(
                key: Key('img1'),
                duration: Duration(milliseconds: 800),
                triggerOffset: Duration(milliseconds: 1000),
              ),
            ],
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: content)));
  }
}
