import 'package:flutter/material.dart';

double adapter({required Map breakpoints, required double width})
{
  int ultraLargeScreenSize = 2000; //=> ul
  int extraLargeScreenSize = 1200; //=> xl
  int largeScreenSize = 992; //=> lg
  int mediumScreenSize = 768; //=> md
  int smallScreenSize = 576; //=> sm
  int extraSmallScreenSize = 360; //=> xs
  int ultraSmallScreenSize = 280; //=> us
  //converts the map data into double
  breakpoints.forEach((key, value)
  {
    breakpoints[key] = value.toDouble();
  });
  //size of the widget
  double widgetSize = 0;
  //for ul
  if(width>=ultraLargeScreenSize)
  {
    widgetSize = breakpoints["ul"]?? breakpoints['sm'];
  }//for xl
  else if(width<ultraLargeScreenSize && width>= extraLargeScreenSize)
  {
    widgetSize = breakpoints["xl"]?? breakpoints['sm'];
  }//for lg
  else if(width<extraLargeScreenSize && width>=largeScreenSize)
  {
    widgetSize = breakpoints['lg']?? breakpoints['sm'];
  }//for md
  else if(width<largeScreenSize && width>= mediumScreenSize)
  {
    widgetSize = breakpoints['md']?? breakpoints['sm'];
  }//for sm
  else if(width<mediumScreenSize && width>= smallScreenSize)
  {
    widgetSize = breakpoints['sm'];
  }//for xs
  else if(width<smallScreenSize && width>=extraSmallScreenSize)
  {
    widgetSize = breakpoints['xs']?? breakpoints['sm'];
  }//for us
  else
  {
    widgetSize = breakpoints['us']?? breakpoints['sm'];
  }
  return widgetSize;
}

/**
 * defines the size of a widget through passed breakpoints parameters
 * Differents available breakpoints are:
 * ul
 * xl
 * lg
 * md
 * sm
 * xs
 * us
 *
 * */
double Width({required var context, required Map breakpoints})
{
  //defining constant values for the screen sizes
  late double _width;
  //if the context is from a layout builder constraints
  if(context is BoxConstraints)
  {
    _width = context.maxWidth;
  }//when it is a context of a frame
  else
  {
    _width = MediaQuery.of(context).size.width;
  }
  //returns the appropriate flex value according to the breakpoint
  return _width * adapter(breakpoints: breakpoints, width: _width) / 12;
}

double Size({required var context, required Map breakpoints})
{
  //defining constant values for the screen sizes
  late double _width;
  if(context is BoxConstraints)
  {
    _width = context.maxWidth;
  }
  else
  {
    _width = MediaQuery.of(context).size.width;
  }
  //returns the appropriate flex value according to the breakpoint
  return adapter(breakpoints: breakpoints, width: _width);
}

class ResponsiveLayout extends StatelessWidget {
  Map breakpoints = {};
  Widget child;
  ResponsiveLayout({required this.breakpoints, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Width(context: context, breakpoints: breakpoints),
        child: child,
      ),
    );
  }
}
