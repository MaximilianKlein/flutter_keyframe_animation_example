import 'package:basic_web_app/responsive.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.local_hospital_rounded,
          size: 64,
        ),
        Text('Company'),
        Expanded(
            child: Responsive(layouts: [
          ResponsiveLayout(
              constraint: downTo(420),
              builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    HeadlineLink('Handbook'),
                    HeadlineLink('Twitter'),
                    HeadlineLink('Podcast'),
                    HeadlineLink('Newsletter'),
                    HeadlineLink('Download'),
                  ],
                );
              }),
          ResponsiveLayout(constraint: catchAll(), builder: (_) => Container()),
        ]))
      ],
    );
  }
}

class HeadlineLink extends StatelessWidget {
  const HeadlineLink(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(5), child: Text(text));
  }
}
