# flutter_keyframe_animation

See a demo at https://maximilianklein.github.io/flutter_keyframe_animation_example/

Run it locally via

```
# local debug, -d chrome also should work, it does not on my machine ;)
flutter run -d web-server

# build release you will find the result under build/web 
flutter build web 
```

This is a short example that I built in a few hours in Flutter. I wanted to recreate some of the
animations on https://museapp.com/ .

I had to write my own Keyframe Animation Widget that allows setting keyframes for child widgets like this:

```dart
KeyframeAnimator(
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
    ], child: Column(children: [
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
        RevealWidget(
            key: Key('paragraph1'),
            child: Responsive(layouts: [
                ResponsiveLayout(
                    constraint: upTo(580),
                    builder: (_) => Text('...', textScaleFactor: 1)),
                ResponsiveLayout(
                    constraint: catchAll(),
                    builder: (_) => Text('...', textScaleFactor: 2)),
            ])),
    ]);
```

I've also built a `Responsive` widget that selects a different widget based on the chosen layout.
