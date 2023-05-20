import 'package:flutter/material.dart';
import 'package:siteco_external/frame1.dart';
import 'package:siteco_external/frame2.dart';
import 'package:siteco_external/widgets/small_screen_app_bar.dart';
import 'package:siteco_external/widgets/stepper.dart';

var frames = [
  StepperFrame(title: "fghjk 0", frame: Container(child: Center(child: Frame1()))),
  StepperFrame(title: "fghjk 1", frame: Container(child: Frame2())),
  StepperFrame(title: "fghjk 2", frame: Container(child: Center(child: Text("2 prime")))),
  // StepperFrame(title: "fghjk 3", frame: Container(child: Center(child: Text("3")))),
  // StepperFrame(title: "fghjk 4", frame: Container(child: Center(child: Text("3")))),
];

class ProjectSetup extends StatefulWidget {
  const ProjectSetup({Key? key}) : super(key: key);

  @override
  State<ProjectSetup> createState() => _ProjectSetupState();
}

class _ProjectSetupState extends State<ProjectSetup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LargeScreenAppBar,
            SizedBox(height: 10,),
            CustStepper(frames: frames, initStep: 0,),
          ],
        ),
      ),
    );
  }
}
