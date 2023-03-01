import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:siteco_external/Consts/colors/colors.dart';

class Frame2Txtfield extends StatefulWidget {
  String hintText;
  bool enabled;
  Color fillColor;
  String value;
  Function? onChanged;
  TextInputType keyboardType;
  List inputFormatters;
  Frame2Txtfield({this.hintText =  "", this.enabled = true, this.fillColor = Colors.white, this.value = "", this.onChanged, this.keyboardType = TextInputType.text, this.inputFormatters = const [], Key? key});

  @override
  State<Frame2Txtfield> createState() => _Frame2TxtfieldState();
}

class _Frame2TxtfieldState extends State<Frame2Txtfield> {
  late String hintText;
  late bool enabled;
  late Color fillColor;
  late String value;
  late TextInputType keyboardType;
  late Function? onChanged;
  late List inputFormatters;

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
    keyboardType = widget.keyboardType;
    inputFormatters = widget.inputFormatters;
  }

  @override
  Widget build(BuildContext context) {
    //Color borderColor = enabled==false ? lightGrey : red;
    Color borderColor = lightGrey;
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      inputFormatters: [...inputFormatters],
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
        child: Container(margin:  EdgeInsets.fromLTRB(2, 4, 2, 4), child: Text(widget.label, style: TextStyle(fontSize: 18, fontWeight: widget.bold ? FontWeight.bold : FontWeight.normal ),)),
      ),
    );
  }
}