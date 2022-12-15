import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:siteco_external/Consts/colors/colors.dart';
import 'package:siteco_external/api/services.dart';
import 'package:siteco_external/functions/api_methods.dart';
import 'package:siteco_external/new_project.dart';
import 'package:siteco_external/widgets/alert.dart';
import 'package:siteco_external/widgets/small_screen_app_bar.dart';
import 'functions/global_data.dart';
import 'models/wiring.dart';

GlobalData data = GlobalData();

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

    //wirings
    fetchAllWirings(context: context, callback: (_)
    {
      data.formValues = {"wirings":_};
      // setState(() {
      //   data.formValues = {"wirings":_};
      // });
    });

    //colors
    fetchAllColors(callback: (_)
    {
      data.formValues = {"colors":_};
      // setState(() {
      //   data.formValues = {"colors":_};
      // });
    });

    //mountings
    fetchAllMountings(callback: (_)
    {
      data.formValues = {"mountings":_};
      // setState(() {
      //   data.formValues = {"mountings":_};
      // });
    });

    //protections
    fetchAllProtections(callback: (_)
    {
      data.formValues = {"protections":_};
      // setState(() {
      //   data.formValues = {"protections":_};
      // });
    });

    //feedout
    fetchAllFeedOut(callback: (_)
    {
      data.formValues = {"feedout":_};
      // setState(() {
      //   data.formValues = {"feedout":_};
      // });
    });

    //feedin
    fetchAllFeedIn(callback: (_)
    {
      data.formValues = {"feedin":_};
      // setState(() {
      //   data.formValues = {"feedin":_};
      // });
    });

    // setState(() {
    //
    // });

    // fetchAllLuminairs(callback: (_)
    // {
    //   setState(() {
    //     data.formValues = {"wiring":_};
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {


    print(data.formValues);
    
    //large screens home page
    Widget LargeScreenPage = Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Siteco top attraction design
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

          //What is siteco light trunking system
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Align(alignment: Alignment.centerRight, child: Container(
              height: 330,
              width: 700,
              color: Colors.white.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text("""Our performance solution Licross® 11 is our innovative trunking system with maximum efficiency, service life and flexibility\n\nThe one-for-all concept offers a variety of luminaire inserts and functional expansion options for maximum flexibility and future compatibility. With its unique 14 cores, the rail system becomes the backbone of the building infrastructure and is ready for a wide range of applications - today and tomorrow.\n\nSimply create a complete configuration of a room with all the possibilities of the system""", style: TextStyle(fontSize: 22),),
              ),
            ),),
          ),

          //Bottom buttons
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
                      //creates the id of the project
                      var id = "7142d53cd17c2ee0cf0ec390555195a7";
                      //sets the id globaly
                      GlobalData data = GlobalData(entry: {"id": id});

                      //navigates towards the next page
                      Navigator.push(context,
                          PageTransition(duration: Duration(milliseconds: 1000), child: const NewProject(), type: PageTransitionType.bottomToTop)
                      );

                       //print(data.formValues);
                    }, child: Text("Start a new project", style: TextStyle(color: Colors.white, fontSize: 18),)),
                  ),
                  SizedBox(width: 15,),

                  //Continue project button
                  SizedBox(width: 390, height: 50, child: TextField(controller: projectID,
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

                  //Language translation button
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

    return Scaffold(
      body: SafeArea(
        child: LargeScreenPage,
      ),
    );
  }
}
