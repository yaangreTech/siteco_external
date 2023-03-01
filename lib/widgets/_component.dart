import 'package:flutter/material.dart';
import 'package:siteco_external/widgets/frame2_textfield.dart';
import 'package:siteco_external/widgets/select.dart';

// presentation of the component and its inputs
class Component extends StatefulWidget {
  List <String> options;
  double textField1Value;
  double textField2Value;
  Component({Key? key, this.options = const [], this.textField1Value = 0, this.textField2Value = 0}) : super(key: key);

  @override
  State<Component> createState() => _ComponentState();
}

class _ComponentState extends State<Component> {
  late List <String> options;
  late double textField1Value;
  late double textField2Value;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    options = widget.options;
    textField1Value = widget.textField1Value;
    textField2Value = widget.textField2Value;

  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: options.length == 1 ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Frame2Txtfield(value: options[0], enabled: false,),
        ) :Padding(
          padding: const EdgeInsets.all(8.0),
          child: Select2(onChanged: (_){}, defaultText: "Ceiling mounting", options: options,),
        )),
        Expanded(flex: 1, child: Row(
          children: [
            Expanded(flex: 1, child: Container()),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Frame2Txtfield(value: textField1Value.toString(),),
            )),
            //SizedBox(width: 20,),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Frame2Txtfield(value: textField2Value.toString(), enabled: false,),
            )),
          ],
        )),
      ],
    );
  }
}