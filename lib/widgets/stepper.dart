import 'package:flutter/material.dart';
import 'package:siteco_external/Consts/colors/colors.dart';
import 'package:siteco_external/widgets/buttons.dart';

class CustStepper extends StatefulWidget {
  late List<StepperFrame> frames;
  late int initStep;

  CustStepper({required this.frames, this.initStep = 0});

  @override
  State<CustStepper> createState() => _CustStepperState();
}

class _CustStepperState extends State<CustStepper> {
  int currentStep = 0;
  //pageview.builder's controller
  var controller;

  var frames;
  List indexFrames = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentStep = widget.initStep;
    controller = PageController(initialPage: currentStep);


  }

  //incresases the current step of the stepper
  void GoForward()
  {
    if(currentStep<widget.frames.length-1)
    {
      setState(() {
        currentStep++;
      });
      controller.animateToPage(currentStep,
          duration: Duration(milliseconds: 2000), curve: Curves.easeInOut);
    }

  }

  //decreases the current step of the stepper
  void GoBackward()
  {
    if(currentStep>=1)
    {
      setState(() {
        currentStep--;
      });
      controller.animateToPage(currentStep,
          duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
    }
  }

  //underlined text widget
  Widget UnderlinedText({color: grey, required String text})
  {
    return Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 5),child: Text(text, style: TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.w600,),), decoration: BoxDecoration(border: Border(bottom: BorderSide(color: color, width: 3))),);
  }

  @override
  Widget build(BuildContext context) {
    frames = widget.frames;
    indexFrames = [];
    bool isCurrentFrame;
    //list of index frames
    for(var i = 0; i < widget.frames.length; i++)
    {
      var number = (i+1).toString().padLeft(2, '0');
      isCurrentFrame = i == currentStep;
      indexFrames.add(GestureDetector(
        onTap: ()
        {
          if(currentStep!=i)
          {
            setState(() {
              currentStep = i;
            });

            controller.animateToPage(currentStep,
                duration: Duration(milliseconds: 2000), curve: Curves.easeInOut);
          }
        },
        child: Row(
          children: [
            UnderlinedText(text: number, color: isCurrentFrame? red: grey),
            SizedBox(width: 10,)
          ],
        ),
      ));
    }

    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //name of the frame
                Expanded(child: UnderlinedText(text: frames[currentStep].title)),
                SizedBox(width: 10,),
                //indicators
                Row(children: [...indexFrames]),
              ],
            ),
            height: 50,
          ),
          //display of the frame
          Expanded(
            child: Container(
              color: Color.fromRGBO(248, 248, 248, 1),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: PageView.builder(
                  controller: controller,
                  itemCount: frames.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index)
                  {
                    return frames[index].frame;
                  }),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: white),
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //hides the previous button when the current step is == 0
                if(currentStep>0)
                  RedOutlinedButton(onPressed: ()
                  {
                    GoBackward();
                  }, child: Row(
                    children: [
                      Icon(Icons.navigate_before_sharp, color: red,),
                      Text("Previous step", style: TextStyle(fontSize: 18, color: red),),
                    ],
                  ))
                else
                  SizedBox(),
                RedOutlinedButton(onPressed: ()
                {
                  GoForward();
                }, child: Row(
                  children: [
                    Text("Save & continue", style: TextStyle(fontSize: 18)),
                    Icon(Icons.navigate_next_sharp)
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//stepper frame

class StepperFrame{
  late String _title;
  late Widget _frame;

  StepperFrame({required String title, required Widget frame})
  {
    _title = title;
    _frame = frame;
  }

  Widget get frame => _frame;

  set frame(Widget value) {
    _frame = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}
