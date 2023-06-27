import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:siteco_external/Consts/colors/colors.dart';
import 'package:siteco_external/Consts/pagenames.dart';
import 'package:siteco_external/functions/api_methods.dart';
import 'package:siteco_external/new_project.dart';
import 'package:siteco_external/widgets/alert.dart';
import 'functions/global_data.dart';


GlobalData data = GlobalData();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //customer's id
  TextEditingController? projectID;
  bool showLoader = true;

  @override
  void initState() {
    projectID = TextEditingController();
    super.initState();
    //fetches all data from the database when they are not yet fetched
    if(data.formValues["data"]==null)
    {
        ()async
        {
          try
          {
            data.formValues = await GetAllData();
            //if the current widget is mounted
            if(this.mounted)
            {
              //hides the loader
              setState(() {
                showLoader = false;
              });
            }
          }
          catch(error, stackTrace)
          {
              print(error);
              data.formValues== {"data":null};
              // redirects to the page of errors
              Navigator.pushNamed(context, ERROR_PAGE);
          }
        }();
    }
    else
    {
      //hides the loader when data already exists
      setState(() {
        showLoader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    //print(json.encode(data.formValues));

    //large screens home page
    Widget LargeScreenPage = Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Siteco top attraction design
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                color: Colors.white,
                width: 300,
                height: 170,
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(child: SvgPicture.asset("assets/images/siteco-logo.svg", fit: BoxFit.contain, ), height: 70, width: 150,),
                    SizedBox(height: 10,),
                    Text("Licross", style: TextStyle(color: red, fontSize: 32, fontWeight: FontWeight.bold),),
                    Text("Trunking System Configurator", style: TextStyle(color: red, fontSize: 18),),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          ),

         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             //what's Licross
             SizedBox(
               height: 35,
               child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                 topRight: Radius.circular(0),
                 topLeft: Radius.circular(0),
                 bottomRight: Radius.circular(0),
               ))),onPressed: ()
               {
                 //navigates towards the next page
                 Navigator.pushNamed(context, WHAT_IS);

                 //print(data.formValues);
               }, child: Text("What is Licross Configurator ?", style: TextStyle(color: red, fontSize: 18),)),
             ),
             SizedBox(width: 15,),

             //new project
             SizedBox(
               height: 35,
               child: ElevatedButton(style: ElevatedButton.styleFrom(primary: red, shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                 topRight: Radius.circular(0),
                 topLeft: Radius.circular(0),
                 bottomRight: Radius.circular(0),
               ))),onPressed: ()
               {
                 //creates the id of the project
                 var id = "7142d53cd17c2ee0cf0ec390555195a7";
                 //sets the id globaly
                 data.formValues = {"id": id};

                 //navigates towards the next page
                 Navigator.push(context,
                     PageTransition(duration: Duration(milliseconds: 1000), child: const NewProject(), type: PageTransitionType.bottomToTop)
                 );

                  //print(data.formValues);
               }, child: Text("Start a new project", style: TextStyle(color: Colors.white, fontSize: 18),)),
             ),
             SizedBox(width: 15,),

             //Continue project button
             SizedBox(width: 390, height: 35, child: TextField(controller: projectID,
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
             SizedBox(width: 15,),

             // electrical planners & end users
             SizedBox(
               height: 35,
               child: ElevatedButton(style: ElevatedButton.styleFrom(primary: red, shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                 topRight: Radius.circular(0),
                 topLeft: Radius.circular(0),
                 bottomRight: Radius.circular(0),
               ))),onPressed: ()
               {
                 //navigates to the next page
                 Navigator.pushNamed(context, WHAT_IS);

                 //print(data.formValues);
               }, child: Text("Users", style: TextStyle(color: Colors.white, fontSize: 18),)),
             ),
             SizedBox(width: 15,),

             //Language translation button
             SizedBox(
               height: 35,
               child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                 topRight: Radius.circular(0),
                 topLeft: Radius.circular(0),
                 bottomRight: Radius.circular(0),
               ))),onPressed: (){}, child: Text("Deutsch", style: TextStyle(color: red, fontSize: 18),)),
             ),
             SizedBox(width: 20,)
           ],
         ),
         SizedBox(height: 10,),

        ],
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/landing.png")
          )
      ),
    );

    // animated loader
    Widget Loader = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Please Wait", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(height: 26,),
                  LoadingAnimationWidget.beat(color: red, size: 40)
                ],
              ),
            ],
          )
        ],
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: showLoader ? Loader : LargeScreenPage,
      ),
    );
  }

  //fetch all db
  // void GetAllData() async
  // {
  //   Map _data = {};
  //   _data = {"feedout": await fetchComponent(apiURL: "getAll-feedout")};
  //   data.formValues == _data;
  // }
}
