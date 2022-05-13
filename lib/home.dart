import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:siteco_external/colors/colors.dart';
import 'package:siteco_external/widgets/small_screen_app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //large screens home page
    Widget LargeScreenPage = Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                color: Colors.white,
                width: 300,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(child: SvgPicture.asset("assets/images/siteco-logo.svg", fit: BoxFit.contain, ), height: 100, width: 200,),
                    SizedBox(height: 30,),
                    Text("Light configuration", style: TextStyle(color: red, fontSize: 32, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      topLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ))),onPressed: (){}, child: Text("What is Light configuration?", style: TextStyle(color: red, fontSize: 22),)),
                  ),
                  SizedBox(width: 15,),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(style: ElevatedButton.styleFrom( shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      topLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ))),onPressed: (){}, child: Text("Start Light configuration?", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),)),
                  ),
                  SizedBox(width: 15,),
                ],
              ),
              SizedBox(height: 10,)
            ],
          ),

        ],
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/landing.jpg")
          )
      ),
    );
    //small screens home page
    Widget SmallScreenPage = Container(
      child: Column(
        children: [
          SmallScreenAppBar,
          Image(image: AssetImage("assets/images/landing.jpg"), fit: BoxFit.contain,),
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Text("What is Light configuration?", style: TextStyle(color: red, fontSize: 22, fontWeight: FontWeight.bold),)),
                    Text("""Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco poriti laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in uienply voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat norin proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
                      style: TextStyle(fontSize: 16),),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: OutlinedButton(onPressed: (){}, style: OutlinedButton.styleFrom(side: BorderSide(color: red)), child: Text("More"))
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(style: ElevatedButton.styleFrom( shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                          topRight: Radius.circular(0),
                          topLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ))),onPressed: (){}, child: Text("Start Light configuration?", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: width > 768 ? LargeScreenPage: SmallScreenPage,
      ),
    );
  }
}
