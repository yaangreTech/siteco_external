import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siteco_external/colors/colors.dart';
import 'package:siteco_external/functions/global_key_extension.dart';
import 'package:siteco_external/functions/path.dart';
import 'package:siteco_external/widgets/buttons.dart';
import 'package:siteco_external/widgets/inputs.dart';
import 'package:siteco_external/widgets/responsive.dart';

//stful widget for advanced config
class AdvancedConfigAlertBox extends StatefulWidget {
  const AdvancedConfigAlertBox({Key? key}) : super(key: key);

  @override
  State<AdvancedConfigAlertBox> createState() => _AdvancedConfigAlertBoxState();
}

class _AdvancedConfigAlertBoxState extends State<AdvancedConfigAlertBox> {
  var alertRadioGroup_luminairs_length = "600";
  var alertRadioGroup_light_diffusion = "Diffuse";
  double sliderValue = 500;
  //list of mounting light_distribution
  List licrossImages = ["assets/images/csm_Siteco_Sirius_Stage.jpg", "assets/images/csm_Siteco_Sport.jpg", "assets/images/landing.jpg", "assets/images/siteco.jpg", "assets/images/csm_Siteco_Sirius_Stage.jpg", "assets/images/csm_Siteco_Sport.jpg", "assets/images/landing.jpg", "assets/images/siteco.jpg"];
  late String selectedImage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedImage = licrossImages[0];
  }

  //light distribution component
  Widget LightDistWidget({required double width, required String label, required String imagePath})
  {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          LabeledRadio(label: label, group: alertRadioGroup_light_diffusion),
          Center(
            child: Image(image: AssetImage(imagePath)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //global key for the licross widget
    var licrossKey = GlobalKey();
    //global key for the popup widget itself
    var containerKey = GlobalKey();

    return Container(
      key: containerKey,
      padding: EdgeInsets.all(10),
      height: GetHeight(context: context) - 40,
      width: Width(context: context, breakpoints: {"sm": 11}),
      child: LayoutBuilder(builder: (context, constraints) {
        double alertHeight = constraints.maxHeight;
        double diffusionComponentWidth =  Width(context: constraints, breakpoints: {"xl": 6.8, "lg": 6.8, "md": 6.8, "sm": 6.8, "xs": 12, "us":12});

        //length of the width of a light diff component
        var lightDistWidth = diffusionComponentWidth * Size(context: context, breakpoints: {"xl": 4, "lg": 4, "md": 4, "sm":4, "cs":6, "xs": 6})/12 - 10;
        Widget diffusionComponent = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Light distribution", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                LightDistWidget(width: lightDistWidth, label: "Diffuse", imagePath: "assets/images/light_distribution/1.png"),
                LightDistWidget(width: lightDistWidth, label: "Wide Beam", imagePath: "assets/images/light_distribution/2.png"),
                LightDistWidget(width: lightDistWidth, label: "Asymmetric", imagePath: "assets/images/light_distribution/3.png"),
                LightDistWidget(width: lightDistWidth, label: "Wide Beam Prismatic", imagePath: "assets/images/light_distribution/4.png"),
                LightDistWidget(width: lightDistWidth, label: "Micro Prisms", imagePath: "assets/images/light_distribution/5.png"),
                LightDistWidget(width: lightDistWidth, label: "2x Asymmetric", imagePath: "assets/images/light_distribution/6.png"),
                LightDistWidget(width: lightDistWidth, label: "Extremely deep", imagePath: "assets/images/light_distribution/7.png"),
              ],
            ),
          ],
        );
        return Stack(
          children: [
            SingleChildScrollView(
              controller: ScrollController(),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: alertHeight,
                    width: Width(context: constraints, breakpoints: {"xl": 5, "lg": 5, "md": 5, "sm":5, "xs": 12, "us":12}),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Luminaires length", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        Text("Choose a default luminairs length (in mm)", style: TextStyle(fontSize: 18, color: grey),),
                        Row(
                          children: [
                            Expanded(child: LabeledRadio(label: "600", group: alertRadioGroup_luminairs_length, onChanged: (_)
                            {
                              setState(() {
                                alertRadioGroup_luminairs_length = _;
                              });
                            },)),
                            Expanded(child: LabeledRadio(label: "750", group: alertRadioGroup_luminairs_length, onChanged: (_)
                            {
                              setState(() {
                                alertRadioGroup_luminairs_length = _;
                              });
                            },)),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: LabeledRadio(label: "1500", group: alertRadioGroup_luminairs_length, onChanged: (_)
                            {
                              setState(() {
                                alertRadioGroup_luminairs_length = _;
                              });
                            },)),
                            Expanded(child: LabeledRadio(label: "2250", group: alertRadioGroup_luminairs_length, onChanged: (_)
                            {
                              setState(() {
                                alertRadioGroup_luminairs_length = _;
                              });
                            },)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Lumen:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            SizedBox(width: 10,),
                            Text(sliderValue.toString(), style: TextStyle(color: red, fontWeight: FontWeight.bold, fontSize: 18))
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          child: CupertinoSlider(
                            value: sliderValue,
                             thumbColor: redLowOpacity,
                            min: 500, max: 900, onChanged: (_)
                            {
                              setState(() {
                                sliderValue = _.roundToDouble();
                              });

                            }),
                        ),
                        //control
                        Text("Control", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Select(options: ["Dali", "___"], onChanged: (_)
                        {

                        }),
                        //licross variant
                        Text("Licross Variant", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Column(
                          children: [
                            SizedBox(
                              width: 180,
                              child: TextButton(key: licrossKey, onPressed: ()
                              {
                                //width of the pressed button
                                var licrossBtnWidth = licrossKey.currentContext!.size!.width;
                                //height of the pressed button
                                var licrossBtnHeight = licrossKey.currentContext!.size!.height;
                                //coord x of the
                                var licrossBtn_x = licrossKey.globalPaintBounds!.left;
                                var licrossBtn_y = licrossKey.globalPaintBounds!.top;
                                //height of the popup
                                var popupHeight = containerKey.globalPaintBounds!.top;

                                showDialog(context: context,
                                    barrierColor: Colors.transparent,
                                    builder: (context)
                                    {
                                      ScrollController controller = ScrollController();
                                      return Stack(
                                        children: [
                                          Positioned(bottom:licrossBtn_y, left: (licrossBtn_x+licrossBtnWidth),child: ConstrainedBox(
                                            constraints: BoxConstraints(maxWidth: 250, ),
                                            child: Dialog(elevation: 2,
                                                child: Container(width: 160, height: licrossBtn_y-popupHeight,
                                                  child: RawScrollbar(
                                                    radius: Radius.circular(20),
                                                    isAlwaysShown: true,
                                                    thumbColor: red,
                                                    controller: controller,
                                                    child: SingleChildScrollView(
                                                      controller: controller,
                                                      child: Column(
                                                        children: licrossImages.map((image)
                                                        {
                                                          return InkWell(
                                                            onTap: ()
                                                            {
                                                              setState(() {
                                                                selectedImage = image;
                                                              });
                                                            },
                                                            child: Tooltip(
                                                              message: image,
                                                              child: Container(
                                                                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                                height: 90,
                                                                width: 160,
                                                                decoration: BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(image),
                                                                        fit: BoxFit.fill
                                                                    )
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ),)),
                                          ))
                                        ],
                                      );
                                    });
                              }, child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //finds the name of the licross image
                                  Flexible(child: Text(selectedImage.split("/")[1].split(".")[0])),
                                  Icon(Icons.arrow_drop_down, size: 28,)
                                ],
                              )),
                            ),
                            Container(
                              width: 180,
                              height: 100,
                              child: Image.asset(selectedImage),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  GetWidth(context: context) > smallScreenSize ?SizedBox(
                    height: alertHeight,
                    width: diffusionComponentWidth,
                    child:  SingleChildScrollView(
                      controller: ScrollController(),
                      child: diffusionComponent,
                    ),
                  ): diffusionComponent,
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: ()
                {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close, color: red,),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GetWidth(context: context) >= smallScreenSize? RedOutlinedButton(child: Text("Save changes"), onPressed: (){}): FloatingActionButton(onPressed: (){}, backgroundColor: Colors.white, child: Icon(Icons.save, color: red, size: 28,),),
            )
          ],
        );
      }),
    );
  }
}
