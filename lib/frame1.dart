import 'package:flutter/material.dart';
import 'package:siteco_external/advanced_config_popup.dart';
import 'package:siteco_external/colors/colors.dart';
import 'package:siteco_external/widgets/alert.dart';
import 'package:siteco_external/widgets/buttons.dart';
import 'package:siteco_external/widgets/inputs.dart';
import 'package:siteco_external/widgets/responsive.dart';

//frame 1
class Frame1 extends StatefulWidget {
  const Frame1({Key? key}) : super(key: key);

  @override
  State<Frame1> createState() => _Frame1State();
}

class _Frame1State extends State<Frame1> {
  var group = "830";
  //default mounted image
  late String selectedMountingImage;
  //list of mounting light_distribution
  List mountingImages = ["assets/images/csm_Siteco_Sirius_Stage.jpg", "assets/images/csm_Siteco_Sport.jpg", "assets/images/landing.jpg", "assets/images/siteco.jpg", "assets/images/csm_Siteco_Sirius_Stage.jpg", "assets/images/csm_Siteco_Sport.jpg", "assets/images/landing.jpg", "assets/images/siteco.jpg"];
  //returns the radio button and its coulorized container
  Widget ColorSelectorItem({required BuildContext context, required String radioLabel, required Widget colorizedContainer})
  {
    double width = Width(context: context, breakpoints: {"xl": 3.5, "lg": 3.5, "md": 5.5, "sm": 5.5, "xs": 12});
    return SizedBox(
      width: width/2.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabeledRadio(label: radioLabel, group: group, onChanged: (_)
          {
            setState(() {
              group = _;
            });
          },),
          Container(
            height: 20,
            width: width/3,
            child: colorizedContainer,
          )
        ],
      ),
    );
  }

  //colorized widget
  Widget ColorizedWidget(List rgb)
  {
    int r = rgb[0];
    int g = rgb[1];
    int b = rgb[2];
    return Container(color: Color.fromRGBO(r, g, b, 1));
  }

  // mounting image alert box
  late Widget mountingImageAlertBoxContainer;
  // advanced configs alert box
  late Widget advancedConfigAlertBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedMountingImage = mountingImages[0];
    var _controller = ScrollController();
    mountingImageAlertBoxContainer = Container(
        height: double.infinity,
        width: 200,
        padding: EdgeInsets.all(8),
        child: RawScrollbar(
          isAlwaysShown: true,
          controller: _controller,
          thumbColor: red,
          radius: Radius.circular(20),
          thickness: 5,
          child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: mountingImages.map((imagePath) {
                  return InkWell(
                    onTap: ()
                    {
                      //updates the mounting image
                      setState(() {
                        selectedMountingImage = imagePath;
                      });
                    },
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: grey, width: 0.2),
                          image: DecorationImage(
                              image: AssetImage(imagePath), fit: BoxFit.contain)),
                    ),
                  );
                }
                ).cast<Widget>().toList(),
              )
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    //width of the screen
    double screenWidth = MediaQuery.of(context).size.width;
    //height of the screen
    double screenHeight = MediaQuery.of(context).size.height;
    Map breakpoints = {"xl": 3.5, "lg": 3.5, "md": 5.5, "sm": 5.5, "xs": 12};
    double containerWidth = Width(context: context, breakpoints: breakpoints);
    return Stack(
        children: [
          Container(
            child: LayoutBuilder(builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(bottom: kFloatingActionButtonMargin + GetWidth(context: context) > smallScreenSize? 28: 70),
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          spacing: Width(context: context, breakpoints: {"xl": 0.5, "lg": 0.5, "md": 0.5, "sm": 0.25, "xs": 0}),
                          runSpacing: 15,
                          children: [
                            SizedBox(
                              height: 400,
                              child: Column(
                                children: [
                                  InputLabel(context: context, label: "Project title", breakpoints: breakpoints, onChanged: (_){}),
                                  InputLabel(context: context, label: "Location", breakpoints: breakpoints, onChanged: (_){}),
                                  InputLabel(context: context, maxLines: 8, label: "Description", breakpoints: breakpoints, onChanged: (_){}),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 400,
                              child: Column(
                                children: [
                                  SelectLabel(context: context, label: "Wiring", options: ["1", "2"], breakpoints: breakpoints, onChanged: (_){}),
                                  SelectLabel(context: context, label: "Protection Class", options: ["1", "2"], breakpoints: breakpoints, onChanged: (_){}),
                                  Container(
                                    //height: 120,
                                    width: containerWidth,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Mounting"),
                                        SizedBox(height: 10,),
                                        Container(
                                          color: Colors.white,
                                          child: Tooltip(
                                            message: "Click here to show available mountings",
                                            child: InkWell(
                                              onTap: ()
                                              {
                                                AlertBox(context: context, child: mountingImageAlertBoxContainer, mainAxisAlignment: MainAxisAlignment.end);
                                              },
                                              child: Container(
                                                  height: 180.0,
                                                  //width: 180.0,
                                                  child: Center(child: Image(image: AssetImage(selectedMountingImage), fit: BoxFit.scaleDown,))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 400,
                              width: containerWidth,
                              child: Column(
                                children: [
                                  InputLabel(context: context, label: "Color", breakpoints: breakpoints, onChanged: (_){}),
                                  SizedBox(height: 10,),
                                  //radio buttons for color
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text("Light"),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Flexible(fit: FlexFit.tight, child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(color: Colors.white, border: Border.all(color: grey)),
                                          child: Center(
                                            child: Wrap(
                                              alignment: WrapAlignment.spaceEvenly,
                                              runSpacing: 30,
                                              children: [
                                                ColorSelectorItem(context: context, radioLabel: "830", colorizedContainer: ColorizedWidget([253, 233, 206] )),
                                                ColorSelectorItem(context: context, radioLabel: "835", colorizedContainer: ColorizedWidget([255, 242, 226])),
                                                ColorSelectorItem(context: context, radioLabel: "840", colorizedContainer: ColorizedWidget([253, 246, 233])),
                                                ColorSelectorItem(context: context, radioLabel: "850", colorizedContainer: ColorizedWidget([242, 248, 255])),
                                                ColorSelectorItem(context: context, radioLabel: "865", colorizedContainer: ColorizedWidget([208, 221, 238])),
                                                ColorSelectorItem(context: context, radioLabel: "827-865", colorizedContainer: Container(
                                                  child: Row(
                                                    children: [
                                                      Flexible(child: ColorizedWidget([242, 248, 255])),
                                                      Flexible(child:ColorizedWidget([255, 242, 226])),
                                                      Flexible(child:ColorizedWidget([253, 233, 206])),
                                                    ],
                                                  ),
                                                )),
                                              ],
                                            ),
                                          ),
                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: screenWidth > 576 ? RedElevatedButton(onPressed: ()
            {
              AlertBox(context: context, child: AdvancedConfigAlertBox());
            }, child: Text("Advanced configurations")):
            Container(margin: EdgeInsets.all(8), child: FloatingActionButton(onPressed: ()
            {
              AlertBox(context: context, child: AdvancedConfigAlertBox());
            }, backgroundColor: red, child: Icon(Icons.add, color: Colors.white,),)),
          )
        ]
    );
  }
}