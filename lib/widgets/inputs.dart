import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siteco_external/Consts/colors/colors.dart';
import 'package:siteco_external/widgets/responsive.dart';

//input + label
Widget InputLabel({required var context, required String label, required breakpoints, required Function onChanged, int maxLines = 1, TextInputType keyboardType = TextInputType.text, int? maxLength= null, String defaultValue = '', String hintText = '', String alignment = 'column', List inputFormatters = const []})
{
  return MixedContainer(
      context: context,
      breakpoints: breakpoints,
      children: [
        //Label(context: context, label: label),
        Text(label),
        SizedBox(height: 10,),
        Input(maxLines: maxLines, maxLength: maxLength, keyboardType: keyboardType, onChanged: onChanged, defaultValue: defaultValue.toString(), inputFormatters: inputFormatters, hintText: hintText),
      ],
      alignment: alignment
  );
}
//select + label
Widget SelectLabel({required var context, required String label, required Map breakpoints, required Function onChanged, required List options})
{
  return MixedContainer(
    context: context,
    breakpoints: breakpoints,
    children: [
      Text(label),
      SizedBox(height: 10),
      Select(onChanged: onChanged, options: options),
    ],
  );
}

//widget for the input
Widget Input({required int maxLines, int? maxLength, required TextInputType keyboardType, required Function onChanged, String hintText = '', String defaultValue = '', List inputFormatters = const []})
{
  TextEditingController controller = TextEditingController(text: defaultValue);
  return Container(
    height: maxLines == 1?40:null,
    child: TextField(
      controller: controller,
      inputFormatters: [...inputFormatters],
      onChanged: (newValue)
      {
        onChanged(newValue);
      },
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(10),
          fillColor: Colors.white,
          hoverColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(0), borderSide: BorderSide(color: Colors.black38)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
          )
      ),
    ),
  );
}

//input + label container
Widget MixedContainer({required var context, required Map breakpoints, required List<Widget> children, String alignment = 'column'})
{
  return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      width: Width(context: context, breakpoints: breakpoints),
      child: alignment == "column" ? Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ): Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      )
  );
}

//select field
class Select extends StatefulWidget {
  List options = [];
  Function onChanged = (){};
  bool showBorders = true;
  Select({required List options, required Function onChanged, bool showBorders=true}){
    this.options = options.map((e) => e.toString()).toList();
    this.onChanged = onChanged;
    this.showBorders = showBorders;
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
      height: 40,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(3),
          color: Colors.white,
          border: widget.showBorders == true ? Border.all(width: 0.8, color: Colors.black): null
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
            value: widget.options[index],
            items: widget.options.map((value) {
              return DropdownMenuItem(
                value: value.toString(),
                child: Text(value.toString()),
              );
            }).toList(),
            onChanged: (selectedValue) {
              setState(()
              {
                index = widget.options.indexOf(selectedValue.toString());
                widget.onChanged(selectedValue.toString());
              });
            },
          ),
        ],
      ),
    );
  }
}

//labelled radio button
class LabeledRadio extends StatefulWidget {
  late String label;
  late var group;
  late Function? onChanged;
  LabeledRadio({Key? key, required this.label, required this.group, this.onChanged}) : super(key: key);

  @override
  State<LabeledRadio> createState() => _LabeledRadioState();
}

class _LabeledRadioState extends State<LabeledRadio> {

  @override
  Widget build(BuildContext context) {
    var group = widget.group;
    String label = widget.label;
    Function? onChanged = widget.onChanged;
    return Row(
      children: [
        Radio(value: label, fillColor: MaterialStateProperty.all(Colors.black87), groupValue: group, onChanged: (_)
        {
          onChanged?.call(_);
        }),
        Flexible(child: Text(label, style: TextStyle(color: red, fontWeight: FontWeight.bold, fontSize: 18),))
      ],
    );
  }
}