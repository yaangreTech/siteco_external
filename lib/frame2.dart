import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:siteco_external/Consts/colors/colors.dart';
import 'package:siteco_external/functions/global_data.dart';

GlobalData data = GlobalData();

class Frame2 extends StatefulWidget {
  const Frame2({Key? key}) : super(key: key);

  @override
  State<Frame2> createState() => _Frame2State();
}

class _Frame2State extends State<Frame2> {
  late List wirings;
  late List colors;
  late List mountings;
  late List protections;
  late List feedIn;
  late List feedOut;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    wirings = data.formValues["wirings"];
    colors = data.formValues["colors"];
    mountings = data.formValues["mountings"];
    protections = data.formValues["protections"];
    feedOut = data.formValues["feedout"];
    feedIn = data.formValues["feedin"];
  }
  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(flex: 6, child: Container(height: 1000,
            child: Column(
              children: [
                //Basic parameter
                Row(
                  children: [
                    Expanded(flex: 2, child: Frame2DottedTxt(label: "Basic parameter")),
                    Expanded(flex: 6, child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 1, child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Select(options: wirings, defaultText: "Wiring", onChanged: (_){}),
                        )),
                        Expanded(flex: 1, child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Select(options: protections, defaultText: "Protection Class", onChanged: (_){}),
                        )),
                        Expanded(flex: 1, child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Select(options: colors, defaultText: "Color", onChanged: (_){}),
                        )),
                      ],
                    )),
                  ],
                ),
                SizedBox(height: 40,),

                //Dimension
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: Frame2DottedTxt(label: "Dimension"),),
                    Expanded(flex: 6, child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                                Expanded(flex: 4, child: Frame2Txtfield(hintText: "Area description for lightband",)),
                                Expanded(flex: 1, child: Frame2DottedTxt(label: "either")),
                                Expanded(flex: 4, child: Frame2Txtfield(hintText: "Number of luminares",)),
                              ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 4, child: Container()),
                            Expanded(flex: 1, child: Frame2DottedTxt(label: "Or")),
                            Expanded(flex: 4, child: Frame2Txtfield(hintText: "Length specification in m",)),
                          ],
                        )],
                        ))
                  ],
                    ),
                SizedBox(height: 40,),

                //Calc & Qty
                Row(
                  children: [
                    Expanded(flex: 2, child: Container(),),
                    Expanded(flex: 6, child: Row(
                      children: [
                        Expanded(flex: 4, child: Container()),
                        Expanded(flex: 4, child: Row(
                          children: [
                            Expanded(child: Frame2DottedTxt(label: "Quantity:")),
                            Expanded(child: Frame2DottedTxt(label: "Calc", bold: false,)),
                            SizedBox(width: 16,),
                            Expanded(child: Frame2DottedTxt(label: "Change", bold: false,))
                          ],
                        )),
                        Expanded(flex: 2, child: Container()),
                      ],
                    )),
                  ],
                ),

                //Luminaire
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: Frame2DottedTxt(label: "Luminaire",)),
                    Expanded(flex: 6, child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(flex: 4, child: Select(onChanged: (_){}, defaultText: "Luminaire selection", options: [],)),
                            Expanded(flex: 4, child: Row(
                              children: [
                                Expanded(child: Container(),),
                                Expanded(child: Frame2Txtfield(value: "33",)),
                                SizedBox(width: 16,),
                                Expanded(child: Frame2Txtfield(value: "33",)),
                              ],
                            )),
                            Expanded(flex: 2, child: Frame2DottedTxt(label: "51TS12CN3B5L",)),
                            // Expanded(flex: 2, child: ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 4, child: Select(onChanged: (_){}, defaultText: "Ceiling mounting", options: [],)),
                            Expanded(flex: 4, child: Row(
                              children: [
                                Expanded(child: Container(),),
                                Expanded(child: Frame2Txtfield(value: "18",)),
                                SizedBox(width: 16,),
                                Expanded(child: Frame2Txtfield(value: "18",)),
                              ],
                            )),
                            Expanded(flex: 2, child: Frame2DottedTxt(label: "59TR9K",)),
                            // Expanded(flex: 2, child: ),
                          ],
                        ),
                      ],
                    ),),

                  ],
                ),
                SizedBox(height: 50,),

                //Accessories
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: Frame2DottedTxt(label: "Accessories",)),
                    Expanded(flex: 6, child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(flex: 4, child: Frame2Txtfield(value: "Mounting rail 1-length", enabled: false,)),
                            Expanded(flex: 4, child: Row(
                              children: [
                                Expanded(child: Container(),),
                                Expanded(child: Frame2Txtfield(value: "0", enabled: false,)),
                                SizedBox(width: 16,),
                                Expanded(child: Frame2Txtfield(value: "0", enabled: false,)),
                              ],
                            )),
                            Expanded(flex: 2, child: Frame2DottedTxt(label: "51TS12CN3B5L",)),
                            // Expanded(flex: 2, child: ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 4, child: Frame2Txtfield(value: "Mounting rail 2-length", enabled: false,)),
                            Expanded(flex: 4, child: Row(
                              children: [
                                Expanded(child: Container(),),
                                Expanded(child: Frame2Txtfield(value: "0", enabled: false,)),
                                SizedBox(width: 16,),
                                Expanded(child: Frame2Txtfield(value: "0", enabled: false,)),
                              ],
                            )),
                            Expanded(flex: 2, child: Frame2DottedTxt(label: "etc",)),
                            // Expanded(flex: 2, child: ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 4, child: Select(onChanged: (_){}, defaultText: "Mounting rail 3-length", options: mountings,)),
                            Expanded(flex: 4, child: Row(
                              children: [
                                Expanded(child: Container(),),
                                Expanded(child: Frame2Txtfield(value: "11",)),
                                SizedBox(width: 16,),
                                Expanded(child: Frame2Txtfield(value: "11",)),
                              ],
                            )),
                            Expanded(flex: 2, child: Container()),
                            // Expanded(flex: 2, child: ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(flex: 4, child: Frame2Txtfield(value: "Joint cover IP64", enabled: false,)),
                            Expanded(flex: 4, child: Row(
                              children: [
                                Expanded(child: Container(),),
                                Expanded(child: Frame2Txtfield(value: "0", enabled: false,)),
                                SizedBox(width: 16,),
                                Expanded(child: Frame2Txtfield(value: "0", enabled: false,)),
                              ],
                            )),
                            Expanded(flex: 2, child: Container()),
                            // Expanded(flex: 2, child: ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(flex: 4, child: Select(onChanged: (_){}, defaultText: "Feed-in 5wire with endcap", options: mountings,)),
                            Expanded(flex: 4, child: Row(
                              children: [
                                Expanded(child: Container(),),
                                Expanded(child: Frame2Txtfield(value: "1",)),
                                SizedBox(width: 16,),
                                Expanded(child: Frame2Txtfield(value: "1",)),
                              ],
                            )),
                            Expanded(flex: 2, child: Container()),
                            // Expanded(flex: 2, child: ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(flex: 4, child: Frame2Txtfield(value: "Blankcover", enabled: false,)),
                            Expanded(flex: 4, child: Row(
                              children: [
                                Expanded(child: Container(),),
                                Expanded(child: Frame2Txtfield(value: "0", enabled: false,)),
                                SizedBox(width: 16,),
                                Expanded(child: Frame2Txtfield(value: "0", enabled: false,)),
                              ],
                            )),
                            Expanded(flex: 2, child: Container()),
                            // Expanded(flex: 2, child: ),
                          ],
                        ),

                      ],
                    ),),

                  ],
                )
                  ],
                )
            ),),
            Expanded(flex: 2, child: Container(height: 800,)),
          ],
        ),
      ),
    );
  }

}

class Frame2Txtfield extends StatefulWidget {
  String hintText;
  bool enabled;
  Color fillColor;
  String value;
  Function? onChanged;
  Frame2Txtfield({this.hintText =  "", this.enabled = true, this.fillColor = Colors.white, this.value = "", this.onChanged, Key? key});

  @override
  State<Frame2Txtfield> createState() => _Frame2TxtfieldState();
}

class _Frame2TxtfieldState extends State<Frame2Txtfield> {
  late String hintText;
  late bool enabled;
  late Color fillColor;
  late String value;
  late Function? onChanged;

  late TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hintText = widget.hintText;
    enabled = widget.enabled;
    fillColor = widget.fillColor;
    value = widget.value;
    onChanged = widget.onChanged;
    controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = enabled==false ? lightGrey : red;
    return TextField(
      controller: controller,
      onChanged: (value)
      {
        onChanged?.call(value);
      },
      enabled: enabled,
      cursorColor: borderColor,
      cursorHeight: 22,
      decoration: InputDecoration(
        hoverColor: fillColor,
          enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: borderColor),
            borderRadius: BorderRadius.all(Radius.circular(0))
          ),
        border:  OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.all(Radius.circular(0))
        ),
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        filled: true,
        fillColor: fillColor,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.all(Radius.circular(0))
        ),
      ),
    );
  }
}

class Frame2DottedTxt extends StatefulWidget {
  String label;
  bool bold;
  Frame2DottedTxt({this.bold = true, this.label = "", Key? key});

  @override
  State<Frame2DottedTxt> createState() => _Frame2DottedTxtState();
}

class _Frame2DottedTxtState extends State<Frame2DottedTxt> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: DottedBorder(
        dashPattern: [6, 6, 6, 6],
        color: grey,
        strokeWidth: 1,
        child: Container(margin:  EdgeInsets.fromLTRB(4, 8, 4, 8),child: Text(widget.label, style: TextStyle(fontSize: 22, fontWeight: widget.bold ? FontWeight.bold : FontWeight.normal ),)),
      ),
    );
  }
}

//select field
class Select extends StatefulWidget {
  List options = [];
  Function onChanged = (){};
  bool showBorders = true;
  String? defaultText;
  Select({required List options, required Function onChanged, bool showBorders=true, this.defaultText}){
    this.options = options.map((e) => e.toString()).toList();
    this.onChanged = onChanged;
    this.showBorders = showBorders;
    if(this.defaultText!=null)
    {
      this.options = [this.defaultText, ...this.options];
    }
  }

  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.onChanged(widget.options[0]);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          border: widget.showBorders == true ? Border.all(width: 0.8, color: red): null
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            elevation: 8,
            focusColor: Colors.white,
            underline: SizedBox(),
            isDense: true,
            isExpanded: true,
            iconEnabledColor: red,
            value: widget.options[index],
            items: widget.options.map((value) {
              return DropdownMenuItem(
                value: value.toString(),
                child: Text(value.toString()),
              );
            }).toList(),
            onChanged: (selectedValue) {
              if(selectedValue!=widget.defaultText)
              {
                setState(()
                {
                  index = widget.options.indexOf(selectedValue.toString());
                  widget.onChanged?.call(selectedValue.toString());
                });
              }
            },
          ),
        ],
      ),
    );
  }
}