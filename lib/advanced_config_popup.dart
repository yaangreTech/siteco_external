import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siteco_external/colors/colors.dart';
import 'package:siteco_external/functions/global_key_extension.dart';
import 'package:siteco_external/widgets/inputs.dart';
import 'package:siteco_external/widgets/responsive.dart';

//stful widget for advanced config
class AdvancedConfigAlertBox extends StatefulWidget {
  const AdvancedConfigAlertBox({Key? key}) : super(key: key);

  @override
  State<AdvancedConfigAlertBox> createState() => _AdvancedConfigAlertBoxState();
}

class _AdvancedConfigAlertBoxState extends State<AdvancedConfigAlertBox> {
  var alertRadioGroup = "600";
  double sliderValue = 500;
  //list of mounting images
  List licrossImages = ["images/csm_Siteco_Sirius_Stage.jpg", "images/csm_Siteco_Sport.jpg", "images/landing.jpg", "images/siteco.jpg", "images/csm_Siteco_Sirius_Stage.jpg", "images/csm_Siteco_Sport.jpg", "images/landing.jpg", "images/siteco.jpg"];
  late String selectedImage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedImage = licrossImages[0];
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
      height: MediaQuery.of(context).size.height - 40,
      width: Width(context: context, breakpoints: {"sm": 10}),
      child: LayoutBuilder(builder: (context, constraints) {
        double alertHeight = constraints.maxHeight;
        return SingleChildScrollView(
          controller: ScrollController(),
          child: Wrap(
            children: [
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
              SizedBox(
                height: alertHeight - 40,
                width: Width(context: constraints, breakpoints: {"xl": 5, "lg": 5, "md": 5, "sm":5, "xs": 12}),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Luminaires lenght ?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    Text("Choose a default luminairs length (in mm)", style: TextStyle(fontSize: 18, color: grey),),
                    Row(
                      children: [
                        Expanded(child: LabeledRadio(label: "600", group: alertRadioGroup, onChanged: (_)
                        {
                          setState(() {
                            alertRadioGroup = _;
                          });
                        },)),
                        Expanded(child: LabeledRadio(label: "750", group: alertRadioGroup, onChanged: (_)
                        {
                          setState(() {
                            alertRadioGroup = _;
                          });
                        },)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: LabeledRadio(label: "1500", group: alertRadioGroup, onChanged: (_)
                        {
                          setState(() {
                            alertRadioGroup = _;
                          });
                        },)),
                        Expanded(child: LabeledRadio(label: "2250", group: alertRadioGroup, onChanged: (_)
                        {
                          setState(() {
                            alertRadioGroup = _;
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
              SizedBox(
                  width: Width(context: constraints, breakpoints: {"xl": 5, "lg": 5, "md": 5, "sm":5, "xs": 12})
              )
            ],
          ),
        );
      }),
    );
  }
}