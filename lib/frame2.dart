import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:siteco_external/colors/colors.dart';
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
    return Container();
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
    print(enabled);
    return TextField(
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
    return DottedBorder(
      dashPattern: [6, 6, 6, 6],
      color: grey,
      strokeWidth: 1,
      child: Container(margin:  EdgeInsets.fromLTRB(4, 8, 4, 8),child: Text(widget.label, style: TextStyle(fontSize: 22, fontWeight: widget.bold ? FontWeight.bold : FontWeight.normal ),)),
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