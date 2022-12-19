import 'package:flutter/material.dart';
import 'package:siteco_external/api/services.dart';
import 'package:siteco_external/functions/global_data.dart';
import 'package:siteco_external/widgets/alert.dart';
import 'package:siteco_external/widgets/buttons.dart';
import 'package:siteco_external/widgets/restart_app.dart';

GlobalData data = GlobalData();

void fetchAllWirings({required BuildContext context, required Function callback})
{
  Services.getData(apiURL: "getAll-wiring").then((value)
  {

      var x = value["data"].map((item)=>item["name"]).toList();
      //callback(x);
      data.formValues = {"wirings":x};
  }).catchError((serverError, stack)
  {
    //print(serverError);
    AlertBox(context: context, child: SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(serverError["status"].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            Text(serverError["message"], style: TextStyle(fontSize: 20),),
            RedOutlinedButton(child: Text("Retry"), onPressed: ()
            {
              RestartWidget.restartApp(context);
            })
          ],
        ),
      ),
    ));
  });
}

void fetchAllColors({required Function callback})
{
  Services.getData(apiURL: "getAll-colors").then((value)
  {
    if(value["status"]=="200")
    {
      var x = value["data"].map((item)=>item["name"]).toList();
      callback(x);
    }
  });
}

void fetchAllMountings({required Function callback})
{
  Services.getData(apiURL: "getAll-mountings").then((value)
  {
    if(value["status"]=="200")
    {
      var x = value["data"].map((item)=>item["name"]).toList();
      callback(x);
    }
  });
}


void fetchAllProtections({required Function callback})
{
  Services.getData(apiURL: "getAll-protections").then((value)
  {
    if(value["status"]=="200")
    {
      var x = value["data"].map((item)=>item["name"]).toList();
      callback(x);
    }
  });
}

void fetchAllFeedIn({required Function callback})
{
  Services.getData(apiURL: "getAll-feedin").then((value)
  {
    if(value["status"]=="200")
    {
      var x = value["data"].map((item)=>item["name"]).toList();
      callback(x);
    }
  });
}

void fetchAllFeedOut({required Function callback})
{
  Services.getData(apiURL: "getAll-feedout").then((value)
  {
    if(value["status"]=="200")
    {
      var x = value["data"].map((item)=>item["name"]).toList();
      callback(x);
    }
  });
}

void fetchAllLuminairs({required Function callback})
{
  Services.getData(apiURL: "getAll-luminairs").then((value)
  {
    if(value["status"]=="200")
    {
      var x = value["data"].map((item)=>item["name"]).toList();
      callback(x);
    }
  });
}

// void fetchAllProtections({required Function callback})
// {
//   Services.getData(apiURL: "getAll-Protections").then((value)
//   {
//     if(value["status"]=="200")
//     {
//       callback(value["data"]);
//     }
//   });
// }
//
// void fetchAllProtections({required Function callback})
// {
//   Services.getData(apiURL: "getAll-Protections").then((value)
//   {
//     if(value["status"]=="200")
//     {
//       callback(value["data"]);
//     }
//   });
// }