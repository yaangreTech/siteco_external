import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:siteco_external/Consts/colors/colors.dart';
import 'package:siteco_external/functions/functions.dart';
import 'package:siteco_external/functions/global_data.dart';
import 'package:flutter/services.dart';
import 'package:siteco_external/widgets/_component.dart';
import 'package:siteco_external/widgets/frame2_textfield.dart';
import 'package:siteco_external/widgets/inputs.dart';
import 'package:siteco_external/widgets/select.dart';

GlobalData data = GlobalData();
var textStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold );

//default
Map choosenData = {};

class Frame2 extends StatefulWidget {
  const Frame2({Key? key}) : super(key: key);

  @override
  State<Frame2> createState() => _Frame2State();
}

class _Frame2State extends State<Frame2> {
  // component name and other attributs
  late List wirings;
  late List colors;
  late List mountings;
  late List protections;
  late List feedIn;
  late List feedOut;
  late List central_feel_in;
  late List luminairs;

  //name of the components
  late List _wirings;
  late List _colors;
  late List _mountings;
  late List _protections;
  late List _feedIn;
  late List _feedOut;
  late List _central_feel_in;
  late List _luminairs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    wirings = data.formValues["data"]["wirings"];
    colors = data.formValues["data"]["colors"];
    mountings = data.formValues["data"]["mountings"];
    protections = data.formValues["data"]["protections"];
    feedOut = data.formValues["data"]["feedout"];
    feedIn = data.formValues["data"]["feedin"];
    central_feel_in = data.formValues["data"]["central_feel_in"];
    luminairs = data.formValues["data"]["luminairs"];

    //retrieves the name of the components
    _wirings = wirings.map((item) => item["name"]).toList();
    _colors = colors.map((item) => item["name"]).toList();
    _mountings = mountings.map((item) => item["name"]).toList();
    _protections = protections.map((item) => item["name"]).toList();
    _feedOut = feedOut.map((item) => item["name"]).toList();
    _feedIn = feedIn.map((item) => item["name"]).toList();
    _central_feel_in = central_feel_in.map((item) => item["name"]).toList();
  }
  @override
  Widget build(BuildContext context)
  {

    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //basic parameters
                  Row(
                    children: [
                      Expanded(child: Text("Basic parameters", style: textStyle,)),
                      Expanded(child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Select2(options: _wirings, defaultText: "Wiring", onChanged: (_){choosenData["wiring"]=_;}),
                      )),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Select2(options: _protections, defaultText: "Protections", onChanged: (_){choosenData["protections"]=_;}),
                      )),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Select2(options: _colors, defaultText: "Color", onChanged: (_){choosenData["color"]=_;}),
                      )),
                    ],
                  ),

                  SizedBox(height: 20,),

                  //Dimension
                  Row(
                    children: [
                      Expanded(child: Text("Dimensions", style: textStyle,)),
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Expanded(child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Input(maxLines: 3, hintText: "Description", keyboardType: TextInputType.text, onChanged: (_){choosenData["description"]=_;}),
                            )),
                            Expanded(child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("either", style: textStyle,),
                                    )),
                                    Expanded(
                                      flex: 2,
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Input(maxLines: 1, hintText: "Number of Luminaires", keyboardType: TextInputType.text, onChanged: (_){choosenData["n_luminaires"]=_;}),
                                    )),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Expanded(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("or", style: textStyle,),
                                    )),
                                    Expanded(
                                        flex: 2,
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Input(maxLines: 1, hintText: "Length specification in m", keyboardType: TextInputType.text, onChanged: (_){choosenData["length_specification"]=_;}),
                                    )),
                                  ],
                                )
                              ],
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),

                  // //Luminaires
                  // Row(
                  //   children: [
                  //     Expanded(child: Text("Luminaires", style: textStyle,)),
                  //     Expanded(flex: 3, child: Component(options: ["Luminaires"], textField1Value: 18, textField2Value: 33,))
                  //   ],
                  // ),
                  //
                  // SizedBox(height: 20,),

                  //Accessories
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Expanded(child: Text("Accessories", style: textStyle,)),
                  //     Expanded(flex: 3, child: Column(
                  //       children: [
                  //         Component(options: ["Mounting rail 1-length"], textField1Value: 18, textField2Value: 33,),
                  //         SizedBox(height: 5,),
                  //         Component(options: ["Luminaires"], textField1Value: 18, textField2Value: 33,),
                  //         SizedBox(height: 5,),
                  //         Component(options: ["Luminaires"], textField1Value: 18, textField2Value: 33,),
                  //         SizedBox(height: 5,),
                  //         Component(options: ["Luminaires"], textField1Value: 18, textField2Value: 33,),
                  //         SizedBox(height: 5,),
                  //         Component(options: ["Luminaires"], textField1Value: 18, textField2Value: 33,),
                  //         SizedBox(height: 5,),
                  //         Component(options: ["Luminaires"], textField1Value: 18, textField2Value: 33,),
                  //         SizedBox(height: 5,)
                  //       ],
                  //     ))
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          Expanded(child: Container(), flex: 2,)
        ],
      ),
    );
  }

}






