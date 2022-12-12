import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:siteco_external/Consts/colors/colors.dart';
import 'package:siteco_external/widgets/alert.dart';
import 'package:siteco_external/widgets/buttons.dart';
import 'package:siteco_external/widgets/inputs.dart';
import 'package:siteco_external/widgets/responsive.dart';

class Frame2 extends StatefulWidget {
  const Frame2({Key? key}) : super(key: key);

  @override
  State<Frame2> createState() => _Frame2State();
}

class _Frame2State extends State<Frame2> {
  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(flex: 6, child: Container(height: 1200, decoration: BoxDecoration(border: Border.all(color: grey)),
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
                          child: Select(options: [5, 7, 9, 11, 14], defaultText: "Wiring", onChanged: (_){}),
                        )),
                        Expanded(flex: 1, child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Select(options: [5, 7, 9, 11, 14], defaultText: "Protection Class", onChanged: (_){}),
                        )),
                        Expanded(flex: 1, child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Select(options: [5, 7, 9, 11, 14], defaultText: "Color", onChanged: (_){}),
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
                            Expanded(flex: 4, child: Select(onChanged: (_){}, defaultText: "Luminare selection", options: [],)),
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
                            Expanded(flex: 4, child: Select(onChanged: (_){}, defaultText: "Mounting rail 3-length", options: [],)),
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
                            Expanded(flex: 4, child: Select(onChanged: (_){}, defaultText: "Feed-in 5wire with endcap", options: [],)),
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
            Expanded(flex: 2, child: Container(height: 800,decoration: BoxDecoration(border: Border.all(color: grey)),)),
          ],
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   var horizontalScrollController = ScrollController();
  //   return Stack(
  //     children: [
  //       SingleChildScrollView(
  //         controller: ScrollController(),
  //         child: Container(
  //           width: double.infinity,
  //           height: 200,
  //           decoration: BoxDecoration(
  //               border: Border.all(color: grey), color: Colors.white),
  //           child: Column(
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Row(
  //                     children: [
  //                       Text("Light Line 1"),
  //                       SizedBox(
  //                         width: 10,
  //                       ),
  //                       SizedBox(
  //                         width: 70,
  //                         height: 30,
  //                         child: Input(
  //                             maxLines: 1,
  //                             keyboardType: TextInputType.text,
  //                             onChanged: (_) {}),
  //                       ),
  //                       SizedBox(
  //                         width: 10,
  //                       ),
  //                       Text("m"),
  //                     ],
  //                   ),
  //                   IconButton(
  //                     onPressed: () {},
  //                     icon: Icon(
  //                       Icons.close,
  //                       color: red,
  //                     ),
  //                   )
  //                 ],
  //               ),
  //               Stack(
  //                 children: [
  //                   RawScrollbar(
  //                     scrollbarOrientation: ScrollbarOrientation.bottom,
  //                     isAlwaysShown: true,
  //                     thumbColor: red,
  //                     controller: horizontalScrollController,
  //                     child: SingleChildScrollView(
  //                       scrollDirection: Axis.horizontal,
  //                       controller: horizontalScrollController,
  //                       child: Row(
  //                         children: [
  //                           Container(
  //                             decoration: BoxDecoration(border: Border.all()),
  //                             width: 180,
  //                             height: 150,
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text("Module 1", style: TextStyle(fontWeight: FontWeight.bold, color: grey),),
  //                                 Expanded(
  //                                   child: Container(
  //                                     decoration: BoxDecoration(border: Border.all()),
  //                                     child: Column(
  //                                       crossAxisAlignment: CrossAxisAlignment.start,
  //                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                       children: [
  //                                         Row(
  //                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                           children: [
  //                                             Text("Product name...", style: TextStyle(color: red, fontWeight: FontWeight.bold),),
  //                                             IconButton(onPressed: (){}, icon: Icon(Icons.close, color: red,))
  //                                           ],
  //                                         ),
  //                                         Text("Quantity: 10", style: TextStyle(color: grey, fontWeight: FontWeight.bold),),
  //                                         SizedBox(height: 15,),
  //                                         Text("Length: 1500mm", style: TextStyle(color: grey, fontWeight: FontWeight.bold),),
  //                                         Row(
  //                                           mainAxisAlignment: MainAxisAlignment.end,
  //                                           children: [
  //                                             IconButton(onPressed: ()
  //                                             {
  //                                               var controller = ScrollController();
  //                                               AlertBox(context: context, child: Container(
  //                                                 width: Width(context: context, breakpoints: {"lg": 7, "md": 7, "sm": 8}),
  //                                                 height: 440,
  //                                                 child: Column(
  //                                                   children: [
  //                                                     Container(
  //                                                       padding: EdgeInsets.symmetric(horizontal: 8),
  //                                                       child: Row(
  //                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                                         children: [
  //                                                           Text('Product Name', style: TextStyle(color: red, fontWeight: FontWeight.bold),),
  //                                                           IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: red))
  //                                                         ],
  //                                                       ),
  //                                                     ),
  //                                                     RawScrollbar(
  //                                                       controller: controller,
  //                                                       thumbColor: red,
  //                                                       child: SingleChildScrollView(
  //                                                         controller: controller,
  //                                                         child: Wrap(
  //                                                           spacing: Width(context: context, breakpoints: {"lg": 0.1, "md": 0.1, "sm": 0}),
  //                                                           children: [
  //                                                             Stack(
  //                                                               children: [
  //                                                                 Container(
  //                                                                   height: 400,
  //                                                                   width: Width(context: context, breakpoints: {"lg": 3, "md": 3, "sm": 8}),
  //                                                                 ),
  //                                                                 Container(
  //                                                                   height: 400,
  //                                                                   width: Width(context: context, breakpoints: {"lg": 3.9, "md": 3.9, "sm": 8}),
  //                                                                 ),
  //                                                               ],
  //                                                             ),
  //                                                           ],
  //                                                         ),
  //                                                       ),
  //                                                     ),
  //                                                   ],
  //                                                 ),
  //                                               ));
  //                                             }, icon: Icon(Icons.edit, color: red,))
  //                                           ],
  //                                         )
  //                                       ],
  //                                     ),
  //                                   ),
  //                                 )
  //                               ],
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   Align(
  //                     alignment: Alignment.bottomRight,
  //                     child: Container(
  //                         margin: EdgeInsets.all(8),
  //                         child: OutlinedButton(
  //                           onPressed: () {},
  //                           child: Text("ADD"),
  //                         )),
  //                   )
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       Align(
  //         child: RedOutlinedButton(
  //             child: Text("New Light Line"),
  //             onPressed: () {
  //               AlertBox(
  //                   context: context,
  //                   dismissible: false,
  //                   child: Container(
  //                     width: 340,
  //                     height: 200,
  //                     child: Column(
  //                       children: [
  //                         Align(
  //                           alignment: Alignment.topRight,
  //                           child: IconButton(
  //                             onPressed: () {
  //                               Navigator.of(context).pop();
  //                             },
  //                             icon: Icon(
  //                               Icons.close,
  //                               color: red,
  //                             ),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: EdgeInsets.all(10),
  //                           child: SizedBox(
  //                             height: 140,
  //                             child: Column(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Row(children: [
  //                                   Expanded(
  //                                     child: Text("Lightline name"),
  //                                     flex: 2,
  //                                   ),
  //                                   Expanded(
  //                                     flex: 3,
  //                                     child: SizedBox(
  //                                       child: Input(
  //                                           maxLines: 1,
  //                                           keyboardType: TextInputType.text,
  //                                           hintText: 'name',
  //                                           onChanged: (_) {}),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                                 Row(
  //                                   children: [
  //                                     Expanded(
  //                                       child: Text("Lightline length"),
  //                                       flex: 2,
  //                                     ),
  //                                     Expanded(
  //                                       flex: 3,
  //                                       child: SizedBox(
  //                                         child: Input(
  //                                             maxLines: 1,
  //                                             keyboardType: TextInputType.text,
  //                                             hintText: '20.',
  //                                             onChanged: (_) {}),
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                                 Align(
  //                                   alignment: Alignment.bottomRight,
  //                                   child: RedOutlinedButton(child: Text("Ok"), onPressed: (){}),
  //                                 )
  //                               ],
  //                             ),
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                   ));
  //             }),
  //       )
  //     ],
  //   );
  // }
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
            focusColor: Colors.white,
            underline: SizedBox(),
            isDense: true,
            isExpanded: true,
            elevation: 0,
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