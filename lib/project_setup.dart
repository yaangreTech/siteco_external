import 'package:flutter/material.dart';
import 'package:siteco_external/colors/colors.dart';
import 'package:siteco_external/widgets/alert.dart';
import 'package:siteco_external/widgets/inputs.dart';
import 'package:siteco_external/widgets/responsive.dart';
import 'package:siteco_external/widgets/small_screen_app_bar.dart';
import 'package:siteco_external/widgets/stepper.dart';

var frames = [
  StepperFrame(title: "fghjk 0", frame: Container(child: Frame1)),
  StepperFrame(title: "fghjk 1", frame: Container(child: Center(child: Text("2")))),
  StepperFrame(title: "fghjk 2", frame: Container(child: Center(child: Text("3")))),
];

class ProjectStup extends StatefulWidget {
  const ProjectStup({Key? key}) : super(key: key);

  @override
  State<ProjectStup> createState() => _ProjectStupState();
}

class _ProjectStupState extends State<ProjectStup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LargeScreenAppBar,
            SizedBox(height: 10,),
            CustStepper(frames: frames,),
          ],
        ),
      ),
    );
  }
}

//frame 1
Widget Frame1 = Container(
  child: LayoutBuilder(builder: (context, constraints) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: Width(context: context, breakpoints: {"xl": 0.5, "lg": 0.5, "md": 0.5, "sm": 12}),
        children: [
          InputLabel(breakpoints: {"xl": 4, "lg": 4, "md": 6, "sm": 12}, context: context, label: "Project Title", maxLines: 1, keyboardType: TextInputType.text, onChanged: (value)
          {
            print(value);
          }),
          SelectLabel(context: context, label: "Color", breakpoints: {"xl": 4, "lg": 4, "md": 6, "sm": 12}, options: ["1", "2"], onChanged: (selectedValue)
          {
            print(selectedValue);
          }),
          SelectLabel(context: context, label: "Wiring", breakpoints: {"xl": 4, "lg": 4, "md": 6, "sm": 12}, options: ["1", "2"], onChanged: (selectedValue)
          {
            print(selectedValue);
          }),
          InputLabel(context: context, label: "Project description", maxLines: 4, breakpoints: {"xl": 4, "lg": 4, "md": 6, "sm": 12}, onChanged: (value)
          {
            print(value);
          }),
          InputLabel(context: context, label: "Note", maxLines: 6, breakpoints: {"xl": 4, "lg": 4, "md": 6, "sm": 12}, onChanged: (value)
          {
            print(value);
          }),
          Container(
            height: 250,
            width: Width(context: context, breakpoints: {"xl": 4, "lg": 4, "md": 6, "sm": 12}),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Mounting"),
                SizedBox(height: 10,),
                InkWell(
                  onTap: ()
                  {
                    AlertBox(context: context, child: Container(), mainAxisAlignment: MainAxisAlignment.end);
                  },
                  child: Image(image: AssetImage("images/csm_Siteco_Sirius_Stage.jpg"), fit: BoxFit.contain,),
                ),
              ],
            ),
          ),
          SelectLabel(context: context, label: "Protection", breakpoints: {"xl": 4, "lg": 4, "md": 6, "sm": 12}, options: ["1", "2"], onChanged: (selectedValue)
          {
            print(selectedValue);
          }),
          InputLabel(context: context, label: "Company", maxLines: 6, breakpoints: {"xl": 4, "lg": 4, "md": 6, "sm": 12}, onChanged: (value)
          {
            print(value);
          }),
          InputLabel(context: context, label: "Contact Person", maxLines: 6, breakpoints: {"xl": 4, "lg": 4, "md": 6, "sm": 12}, onChanged: (value)
          {
            print(value);
          }),
        ],
      ),
    );
  }),
);

