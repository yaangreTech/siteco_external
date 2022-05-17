import 'package:flutter/material.dart';

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return renderObject!.paintBounds.shift(offset);
    } else {
      return null;
    }
  }
}

final containerKey = GlobalKey();

void printWidgetPosition() {
  print('absolute coordinates on screen: ${containerKey.globalPaintBounds}');
}

void main()
{
  runApp(MaterialApp(home: Scaffold(body: MyApp(),),));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var sliderDefaultValue = 500.0;
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              key: containerKey,
              decoration: BoxDecoration(border: Border.all()),
              width: 180,
              height: 80,
            ),
            TextButton(onPressed: ()
                {
                  printWidgetPosition();
                }, child: Text("click")),
            Slider(value: sliderDefaultValue, divisions: 400, label: sliderDefaultValue.toString(), min: 500, max: 900, onChanged: (_)
            {
              setState(() {
                sliderDefaultValue = _;
              });
            }),
          ],
        ),
      ),
    );
  }
}
