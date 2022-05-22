import 'package:flutter/material.dart';
import 'package:siteco_external/frame1.dart';
import 'package:siteco_external/frame2.dart';
import 'package:siteco_external/frame3.dart';
import 'package:siteco_external/widgets/small_screen_app_bar.dart';
import 'package:siteco_external/widgets/stepper.dart';

var frames = [
  StepperFrame(title: "Project Details", frame: Container(child: Center(child: Frame1()))),
  StepperFrame(title: "Module's configuration", frame: Container(child: Frame2())),
  StepperFrame(title: "Summary", frame: Container(child: Frame3())),
];

class ProjectSetup extends StatefulWidget {
  const ProjectSetup({Key? key}) : super(key: key);

  @override
  State<ProjectSetup> createState() => _ProjectSetupState();
}

class _ProjectSetupState extends State<ProjectSetup> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LargeScreenAppBar,
            SizedBox(height: 10,),
            CustStepper(frames: frames,initStep: 0,
              //   controller: (x, y)
              // {
              //     if(currentStep==2)
              //     {
              //       y();
              //     }
              // }, onFrameChanged: (_)
              // {
              //   setState(() {
              //     currentStep = _;
              //   });
              // },
              ),
          ],
        ),
      ),
    );
  }
}
