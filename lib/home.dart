import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:siteco_external/colors/colors.dart';
import 'package:siteco_external/new_project.dart';
import 'package:siteco_external/widgets/alert.dart';
import 'package:siteco_external/widgets/small_screen_app_bar.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //customer's id
  TextEditingController? projectID;

  @override
  void initState() {
    projectID = TextEditingController();
    super.initState();
  }

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
                width: 400,
                height: 250,
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(child: SvgPicture.asset("assets/images/siteco-logo.svg", fit: BoxFit.contain, ), height: 100, width: 200,),
                    SizedBox(height: 30,),
                    Text("Licross", style: TextStyle(color: red, fontSize: 32, fontWeight: FontWeight.bold),),
                    Text("Trunking System Configurator", style: TextStyle(color: red, fontSize: 24),),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Align(alignment: Alignment.centerRight, child: Container(
              height: 450,
              width: 700,
              color: Colors.white.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text("""Our performance solution Licross® 11 is our innovative trunking system with maximum efficiency, service life and flexibility\n\nThe one-for-all concept offers a variety of luminaire inserts and functional expansion options for maximum flexibility and future compatibility. With its unique 14 cores, the rail system becomes the backbone of the building infrastructure and is ready for a wide range of applications - today and tomorrow.\n\nSimply create a complete configuration of a room with all the possibilities of the system""", style: TextStyle(fontSize: 22),),
              ),
            ),),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(style: ElevatedButton.styleFrom(primary: red, shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      topLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ))),onPressed: ()
                    {
                      Navigator.push(context,
                          PageAnimationTransition(page: const NewProject(), pageAnimationType: BottomToTopTransition())
                      );
                    }, child: Text("Start", style: TextStyle(color: Colors.white, fontSize: 18),)),
                  ),
                  SizedBox(width: 15,),
                  SizedBox(width: 320, height: 50, child: TextField(controller: projectID,
                    cursorColor: grey,
                    cursorHeight: 22,
                    decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: grey),
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
                    hintText: 'Project ID',
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    suffixIcon: MaterialButton(
                      height: 60,
                      onPressed: ()
                      {
                        //displays the loader
                        AlertBox(context: context, child: Container(height: 150, width: 350, child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Loading", style: TextStyle(fontSize: 32),),
                              LoadingAnimationWidget.waveDots(color: red, size: 100)
                            ],
                          ),
                        )));
                      },
                      child: Text(
                        'Continue',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      color: red,
                    )
                  ),),),
                  SizedBox(width: 195,),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      topLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ))),onPressed: (){}, child: Text("Deutsch", style: TextStyle(color: red, fontSize: 18),)),
                  ),
                  SizedBox(width: 20,)
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
                        ))),onPressed: ()
                        {
                        }, child: Text("Start Light configuration?", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)),
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
