import 'package:flutter/material.dart';
import 'package:siteco_external/Consts/colors/colors.dart';

//select field
class Select2 extends StatefulWidget {
  List options = [];
  Function onChanged = (){};
  bool showBorders = true;
  String? defaultText;
  Select2({required List options, required Function onChanged, bool showBorders=false, this.defaultText}){
    this.options = options.map((e) => e.toString()).toList();
    this.onChanged = onChanged;
    this.showBorders = showBorders;
    if(this.defaultText!=null)
    {
      this.options = [this.defaultText, ...this.options];
    }
  }

  @override
  _Select2State createState() => _Select2State();
}

class _Select2State extends State<Select2> {
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
          border: widget.showBorders == true ? Border.all(width: 0.8, color: red): null
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            icon: Icon(Icons.keyboard_arrow_down),
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
                child: Text(value.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
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