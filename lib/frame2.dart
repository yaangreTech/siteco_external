import 'package:flutter/material.dart';
import 'package:siteco_external/colors/colors.dart';
import 'package:siteco_external/functions/global_data.dart';
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
  Widget build(BuildContext context) {
    print(GlobalData().formValues);
    var horizontalScrollController = ScrollController();
    return Stack(
      children: [
        SingleChildScrollView(
          controller: ScrollController(),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                border: Border.all(color: grey), color: Colors.white),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Light Line 1"),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 70,
                          height: 30,
                          child: Input(
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                              onChanged: (_) {}),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("m"),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        color: red,
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    RawScrollbar(
                      scrollbarOrientation: ScrollbarOrientation.bottom,
                      isAlwaysShown: true,
                      thumbColor: red,
                      controller: horizontalScrollController,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: horizontalScrollController,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(border: Border.all()),
                              width: 180,
                              height: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Module 1", style: TextStyle(fontWeight: FontWeight.bold, color: grey),),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(border: Border.all()),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Product name...", style: TextStyle(color: red, fontWeight: FontWeight.bold),),
                                              IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: red,))
                                            ],
                                          ),
                                          Text("Quantity: 10", style: TextStyle(color: grey, fontWeight: FontWeight.bold),),
                                          SizedBox(height: 15,),
                                          Text("Length: 1500mm", style: TextStyle(color: grey, fontWeight: FontWeight.bold),),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              IconButton(onPressed: ()
                                              {
                                                var controller = ScrollController();
                                                AlertBox(context: context, child: Container(
                                                  width: Width(context: context, breakpoints: {"lg": 7, "md": 7, "sm": 8}),
                                                  height: 440,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text('Product Name', style: TextStyle(color: red, fontWeight: FontWeight.bold),),
                                                            IconButton(onPressed: (){}, icon: Icon(Icons.close, color: red))
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 360,
                                                        child: RawScrollbar(
                                                          controller: controller,
                                                          thumbColor: red,
                                                          child: SingleChildScrollView(
                                                            controller: controller,
                                                            child: Wrap(
                                                              spacing: Width(context: context, breakpoints: {"lg": 0.1, "md": 0.1, "sm": 0}),
                                                              children: [
                                                                Container(
                                                                  width: Width(context: context, breakpoints: {"lg": 3, "md": 3, "sm": 8}),
                                                                  child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Expanded(flex: 1, child: Text("Quantity", style: TextStyle(fontWeight: FontWeight.bold, color: grey),)),
                                                                          Expanded(flex: 2, child: Input(maxLines: 1, keyboardType: TextInputType.text, onChanged: (_)
                                                                          {

                                                                          }))

                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Expanded(flex: 1, child: Text("Length", style: TextStyle(fontWeight: FontWeight.bold, color: grey),)),
                                                                          Expanded(flex: 2, child: Select(options: [1, 2],onChanged: (_){},))
                                                                        ],
                                                                      ),
                                                                      Image(image: AssetImage("assets/images/siteco.jpg")),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 400,
                                                                  width: Width(context: context, breakpoints: {"lg": 3.9, "md": 3.9, "sm": 8}),
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Expanded(child: Text("Change product")),
                                                                          Expanded(child: Select(options: [1, 2, 3], onChanged: (_){

                                                                          },), )
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          RedOutlinedButton(child: Text("OK"), onPressed: ()
                                                          {

                                                          })
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ));
                                              }, icon: Icon(Icons.edit, color: red,))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          margin: EdgeInsets.all(8),
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text("ADD"),
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          child: RedOutlinedButton(
              child: Text("New Light Line"),
              onPressed: () {
                AlertBox(
                    context: context,
                    dismissible: false,
                    child: Container(
                      width: 340,
                      height: 200,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.close,
                                color: red,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SizedBox(
                              height: 140,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    Expanded(
                                      child: Text("Lightline name"),
                                      flex: 2,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: SizedBox(
                                        child: Input(
                                            maxLines: 1,
                                            keyboardType: TextInputType.text,
                                            hintText: 'name',
                                            onChanged: (_) {}),
                                      ),
                                    ),
                                  ]),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text("Lightline length"),
                                        flex: 2,
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: SizedBox(
                                          child: Input(
                                              maxLines: 1,
                                              keyboardType: TextInputType.text,
                                              hintText: '20.',
                                              onChanged: (_) {}),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: RedOutlinedButton(child: Text("Ok"), onPressed: (){}),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ));
              }),
        )
      ],
    );
  }
}
