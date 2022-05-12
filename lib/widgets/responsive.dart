import 'package:flutter/material.dart';

double adapter({required Map breakpoints, required double width})
{
  int largeScreenSize = 1366;
  int customScreenSize = 1100;
  int mediumScreenSize = 768;
  int smallScreenSize = 576;
  int xtraScreenSize = 360;
  Map br = {};
  //converts the map data into double
  breakpoints.forEach((key, value)
  {
    br[key] = value.toDouble();
  });

  if(width >= largeScreenSize)
  {
    return br['lg'];
  }
  else if(customScreenSize <= width  && width < largeScreenSize)
  {
    return br['cs'];
  }
  else if(mediumScreenSize <= width && width < customScreenSize)
  {
    return br['md'];
  }
  else if(xtraScreenSize <= width && width < smallScreenSize)
  {
    return br['xs'] != null ? br['xs'] : br['sm'];
  }
  else
  {
    return br['sm'];
  }
}

double Width({required var context, required Map breakpoints})
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
