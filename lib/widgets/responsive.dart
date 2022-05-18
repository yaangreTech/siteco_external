import 'package:flutter/material.dart';

//constants widths for screens
const int ultraLargeScreenSize = 2000; //=> ul
const int extraLargeScreenSize = 1200; //=> xl
const int largeScreenSize = 992; //=> lg
const int mediumScreenSize = 768; //=> md
const int customScreenSize = (768+576)~/2;//=>cs
const int smallScreenSize = 576; //=> sm
const int extraSmallScreenSize = 360; //=> xs
const int ultraSmallScreenSize = 280; //=> us

double adapter({required Map breakpoints, required double width})
{
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
  }//for cs
  else if(width<mediumScreenSize && width>= customScreenSize)
  {
    widgetSize = breakpoints['cs']?? breakpoints['sm'];
  }//for sm
  else if(width<customScreenSize && width>= smallScreenSize)
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
//method to get the width of the screen
double GetWidth({required var context})
{
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
  return _width;
}
//method to get the height of the screen
double GetHeight({required var context})
{
  late double _height;
  //if the context is from a layout builder constraints
  if(context is BoxConstraints)
  {
    _height = context.maxHeight;
  }//when it is a context of a frame
  else
  {
    _height = MediaQuery.of(context).size.height;
  }
  return _height;
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
  //gets the width of the screen
  double _width = GetWidth(context: context);

  //returns the appropriate flex value according to the breakpoint
  return _width * adapter(breakpoints: breakpoints, width: _width) / 12;
}

double Size({required var context, required Map breakpoints})
{
  //gets the width of the screen
  double _width = GetWidth(context: context);

  //returns the appropriate flex value according to the breakpoint
  return adapter(breakpoints: breakpoints, width: _width);
}

//get the size function of the breakpoints and the provided width
double Expanse({required double width, required Map breakpoints})
{
  return width * adapter(breakpoints: breakpoints, width: width)/12;
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
