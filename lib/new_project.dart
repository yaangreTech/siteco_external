import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:siteco_external/frame1.dart';
import 'package:siteco_external/frame2.dart';
import 'package:siteco_external/functions/functions.dart';
import 'package:siteco_external/widgets/buttons.dart';
import 'package:siteco_external/Consts/colors/colors.dart';
import 'functions/global_data.dart';
import 'home.dart';
import 'widgets/stepper.dart';
import 'package:share_plus/share_plus.dart';

//creates a global data instance
GlobalData data = GlobalData();
//the id of the project
var project_id;

var frames = [
  StepperFrame(title: "Configuration setup", frame: Container(child: Center(child: Frame1()))),
  StepperFrame(title: "Luminare selection – basic logic 2",
      frames: [Container(child: Frame2()), Container(child: Container(child: Text("Sub step 3"),),)]),
  StepperFrame(title: "Luminare selection – basic logic", frame: Container(child: Frame2()),),
];

class NewProject extends StatefulWidget {
  const NewProject({Key? key}) : super(key: key);

  @override
  State<NewProject> createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  @override
  Widget build(BuildContext context) {
    //sets the id of the project
    project_id = data.formValues["id"];
    return Scaffold(
      body: Column(
        children: [
          Banner(context = context),
          SizedBox(height: 40,),
          CustStepper(frames: frames, initStep: 1,),
        ],
      ),
    );
  }
}


Widget Banner (BuildContext context)
{
  return Container(
    height: 40,
    width: MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      textBaseline: TextBaseline.alphabetic,
      children: [
      Container(
        margin: EdgeInsets.fromLTRB(30,0,0,0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          textBaseline: TextBaseline.alphabetic,
          children: [
            SizedBox(child: SvgPicture.asset("assets/images/siteco-logo.svg", fit: BoxFit.contain, ), height: 70, width: 200,),
            SizedBox(width: 15),
            Text("Licross Configurator", style: TextStyle(fontSize: 22, color: red, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      // Row(
      //   children: [
      //     RedOutlinedButton(onPressed: ()
      //     {
      //       FlutterClipboard.copy(project_id).then(( value ) => iDCopied(context: context));
      //     }, child: Row(
      //       children: [
      //         Text("Copy", style: TextStyle(fontSize: 18, color: red),),
      //         SizedBox(width: 15,),
      //         Icon(Icons.copy, color: red,)
      //       ],
      //     )),
      //     SizedBox(width: 20,),
      //     RedOutlinedButton(onPressed: ()
      //     {
      //       Share.share(project_id);
      //     }, child: Row(
      //       children: [
      //         Text("Share via Email", style: TextStyle(fontSize: 18, color: red),),
      //         SizedBox(width: 15,),
      //         Icon(Icons.email_outlined, color: red)
      //       ],
      //     )),
      //   ],
      // ),
      Row(
        children: [
          IconButton(onPressed: ()
          {
            Navigator.push(context, PageTransition(duration: Duration(milliseconds: 1000), child: const Home(), type: PageTransitionType.topToBottom));
          }, icon: Icon(Icons.home_outlined, size: 32,)),
            SizedBox(width: 15,),
        ],
      )

    ],),
  );
}
