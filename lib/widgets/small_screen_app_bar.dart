import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:siteco_external/colors/colors.dart';

//small screen app bar
Widget SmallScreenAppBar = Container(
  decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey, width: 2))),
  padding: EdgeInsets.all(10),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        child: SvgPicture.asset("assets/images/siteco-logo.svg"),
        height: 20,
        width: 100,
      ),
      Text(
        "Light configuration",
        style: TextStyle(color: red, fontSize: 18, fontWeight: FontWeight.bold),
      )
    ],
  ),
);

//large screen app bar
Widget LargeScreenAppBar = Container(
  decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey, width: 2)), color: Colors.orangeAccent,),
  padding: EdgeInsets.all(10),
  width: double.infinity,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Row(
          children: [
            SizedBox(
              child: SvgPicture.asset("assets/images/siteco-logo.svg"),
              height: 20,
              width: 100,
            ),
            Text(
              "Light configuration",
              style: TextStyle(color: red, fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      Expanded(child: IconButton(onPressed: (){}, icon: Icon(Icons.home, color: red,)))
    ],
  ),
);
