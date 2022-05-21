import 'package:flutter/material.dart';
import 'package:siteco_external/colors/colors.dart';
import 'package:siteco_external/widgets/alert.dart';
import 'package:siteco_external/widgets/buttons.dart';
import 'package:siteco_external/widgets/inputs.dart';
import 'package:siteco_external/widgets/responsive.dart';

class Frame3 extends StatefulWidget {
  const Frame3({Key? key}) : super(key: key);

  @override
  State<Frame3> createState() => _Frame3State();
}

class _Frame3State extends State<Frame3> {
  Widget GreyText({required String label})
  {
    return Text(label, style: TextStyle(color: grey, fontSize: 16));
  }
  @override
  Widget build(BuildContext context) {
    var projectDetailsWidth = Width(context: context, breakpoints: {"md": 5,"sm":5, "cs": 12, "xs":12});
    var columns = ["Name", "ID", "Amount", "Item", "Price", "Total", "price"].map((label) => DataColumn(label: GreyText(label: label))).toList();
    var cells = List.generate(7, (index) => "...");
    var rows = [] ;
    for(var i = 0; i < 7; i++)
    {
      rows.add(DataRow(cells: cells.map((cell) => DataCell(GreyText(label: cell))).toList()));
    }

    return Stack(
      children: [
        SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: grey, width: 3))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Project title: XXXXX", style: TextStyle(color: grey, fontSize: 18),),
                    Text("Price: XXXX", style: TextStyle(color: grey, fontSize: 18),),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: grey, width: 2))),
                padding: EdgeInsets.only(bottom: 10),
                width: GetWidth(context: context),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Container(
                      width: projectDetailsWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GreyText(label:"Wiring"),
                                GreyText(label:"Note"),
                                GreyText(label:"Protection"),
                                GreyText(label:"Mounting"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GreyText(label:"....."),
                                GreyText(label:"....."),
                                GreyText(label:"....."),
                                GreyText(label:"....."),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: projectDetailsWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GreyText(label:"Company"),
                                GreyText(label:"Contact person"),
                                GreyText(label:"House str."),
                                GreyText(label:"Email"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GreyText(label:"....."),
                                GreyText(label:"....."),
                                GreyText(label:"....."),
                                GreyText(label:"....."),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //data table
              Container(width: GetWidth(context: context),child: DataTable(columns: columns, rows: rows.cast<DataRow>())),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            //decoration: BoxDecoration(border: Border.all()),
            width: 300,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RedOutlinedButton(child: Row(
                  children: [
                    Text("Share"),
                    Icon(Icons.share)
                  ],
                ), onPressed: (){}),
                RedOutlinedButton(child: Row(
                  children: [
                    Text("Print"),
                    Icon(Icons.print)
                  ],
                ), onPressed: (){}),
                RedOutlinedButton(child: Row(
                  children: [
                    Text("PDF"),
                    Icon(Icons.picture_as_pdf_outlined)
                  ],
                ), onPressed: (){}),
              ],
            ),
          ),
        )
      ],
    );
  }
}