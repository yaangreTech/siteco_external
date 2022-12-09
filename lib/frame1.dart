import 'package:flutter/material.dart';
import 'package:siteco_external/advanced_config_popup.dart';
import 'package:siteco_external/colors/colors.dart';
import 'package:siteco_external/widgets/alert.dart';
import 'package:siteco_external/widgets/buttons.dart';
import 'package:siteco_external/widgets/inputs.dart';
import 'package:siteco_external/widgets/responsive.dart';

//frame 1
class Frame1 extends StatefulWidget {
  const Frame1({Key? key}) : super(key: key);

  @override
  State<Frame1> createState() => _Frame1State();
}

class _Frame1State extends State<Frame1> {
  bool? chkBox1 = true;
  bool? chkBox2 = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(150, 0, 150, 0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: Text("Project Title", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: grey),)),
              Expanded(flex: 5, child: TextField(
                cursorColor: grey,
                cursorHeight: 22,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
                  hintText: "Config Id",
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: grey),
                    borderRadius: BorderRadius.all(Radius.circular(0))
                  ),
                ),
              ))
            ],
          ),
          SizedBox(height: 40,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: Text("Configuration Mode", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: grey),)),
              Expanded(flex: 5, child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor: red,
                        //checkColor: red,
                          value: chkBox1,
                          onChanged: (bool? value){
                            setState(() {
                              chkBox1 = value;
                            });
                          }
                      ),
                      SizedBox(width: 20,),
                      Text("Directly select components", style: TextStyle(fontSize: 22, color: grey))
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: red,
                        //checkColor: red,
                          value: chkBox2,
                          onChanged: (bool? value){
                            setState(() {
                              chkBox2 = value;
                            });
                          }
                      ),
                      SizedBox(width: 20,),
                      Text("Start configuration based on room size (auto-proposed configuration)", style: TextStyle(fontSize: 22, color: grey),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: grey, width: 1)),
                    child: Column(
                      children: [
                        RoomConfigItem(label: "Length (m)", sliderValue: 30, max: 60, min: 1),
                        RoomConfigItem(label: "Width (m)", sliderValue: 30, max: 60, min: 1),
                        RoomConfigItem(label: "Height (m)", sliderValue: 7, max: 14, min: 1),
                        RoomConfigItem(label: "Mounting height (m)", sliderValue: 2, max: 14, min: 1),
                        RoomConfigItem(label: "Desired illuminance (lux)", sliderValue: 300, max: 500, min: 100),
                      ],
                    ),
                  )
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }
}

//contains a label, a slider and a controllable field => used for giving the config details of the room

class RoomConfigItem extends StatefulWidget {
  String label;
  double sliderValue;
  double min;
  double max;
  RoomConfigItem({required this.label, required this.sliderValue, required this.max, required this.min, Key? key});

  @override
  State<RoomConfigItem> createState() => _RoomConfigItemState();
}

class _RoomConfigItemState extends State<RoomConfigItem> {
  late String label;
  late double sliderValue;
  late double min;
  late double max;

  late TextEditingController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    label = widget.label;
    sliderValue = widget.sliderValue;
    min = widget.min;
    max = widget.max;

    _controller = TextEditingController(text: widget.sliderValue.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.symmetric(vertical: 10),padding: EdgeInsets.symmetric(horizontal: 20),height: 50, child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 2, child: Text(label, style: TextStyle(fontSize: 22, color: grey),)),
        Expanded(flex: 6, child: Slider(min: min, max: max, activeColor: red, thumbColor: red, value: sliderValue, onChanged: (newValue)
        {
          setState(() {
            sliderValue = newValue;
            _controller.text = sliderValue.round().toString();
          });
        })),
        SizedBox(width: 150, child: Row(
          children: [
            IconButton(onPressed: ()
            {
              setState(() {
                if(sliderValue>0)
                  {
                    sliderValue--;
                    onSliderValueChanged();
                  }
              });
            }, icon: Icon(Icons.remove, color: grey,)),
            Container(width: 70,
                child: TextField(
                  onChanged: (newValue)
                  {
                    var value = double.parse(newValue);
                    if(value > min && value < max)
                    {
                      setState(() {
                        sliderValue = value;
                      });
                    }
                    else
                    {
                      onSliderValueChanged();
                    }
                  },
              controller: _controller,
              cursorColor: grey,
              cursorHeight: 22,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: grey),
                    borderRadius: BorderRadius.all(Radius.circular(0))
                ),
              ),
            )),
            IconButton(onPressed: ()
            {
              setState(() {
                if(sliderValue < max)
                  {
                    sliderValue++;
                    onSliderValueChanged();
                  }
              });
            }, icon: Icon(Icons.add, color: red,)),
          ],
        ),)
      ],
    ),);;
  }

  void onSliderValueChanged()
  {
    _controller.text = sliderValue.round().toString();
  }
}
