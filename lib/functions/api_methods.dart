import 'dart:convert';

import 'package:siteco_external/api/services.dart';
import 'package:siteco_external/functions/global_data.dart';

GlobalData data = GlobalData();
//fetch all db
Future GetAllData() async
{
  // contains data that will be retrieved
  Map _data = {};
  try
  {
    //wirings
    _data.addAll({"wirings": await fetchComponent(apiURL: "getAll-wirings")});
    //feedin
    _data.addAll({"feedin": await fetchComponent(apiURL: "getAll-feedin")});
    //feedout
    _data.addAll({"feedout": await fetchComponent(apiURL: "getAll-feedout")});
    //mountings
    _data.addAll({"mountings": await fetchComponent(apiURL: "getAll-mountings")});
    //central_feel_in
    _data.addAll({"central_feel_in": await fetchComponent(apiURL: "getAll-CentralFeelIn")});
    //luminairs
    _data.addAll({"luminairs": await fetchComponent(apiURL: "getAll-luminairs")});
    //colors
    _data.addAll({"colors": await fetchComponent(apiURL: "getAll-colors")});

    if(errorsStack.isEmpty)
    {
      return {"data": _data};
    }
    else
    {
      throw Exception("An error occured while fetching data");
    }
  }
  catch (e)
  {
    print(e);
    return Future.error(errorsStack);
  }

  // if(errors.isEmpty)
  // {
  //   return {"data": _data};
  // }
  // else
  // {
  //   return errors;
  // }
  // print(errors);
  // return errors.isEmpty ? {"data": _data}: errors;
}

//list of occurred errors while fetching data
List errorsStack = [];

void HandleErrors(serverError, stack)
{
  //adds errors to the list
  errorsStack.add(serverError);
}

Future fetchComponent({required String apiURL})async
{
  return await Services.getData(apiURL: apiURL).then((value)
  {
    var data  = value["data"];
    data = data.map((item)
    {
      item.remove("created_at");
      item.remove("updated_at");
      return item;
    }).toList();
    return data;
  }).catchError(HandleErrors);
}

// void fetchAllProtections({required Function callback})
// {
//   Services.getData(apiURL: "getAll-Protections").then((value)
//   {
//     var x = value["data"].map((item)=>item["name"]).toList();
//     data.formValues = {"protections":x};
//   }).catchError(HandleErrors);
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

/*
//wirings
void fetchAllWirings()
{
  Services.getData(apiURL: "getAll-wirings").then((value)
  {
    var x  = value["data"];
    x = x.map((item)
    {
      item.remove("created_at");
      item.remove("updated_at");
      return item;
    }).toList();
    data.formValues = {"wirings":x};
  }).catchError(HandleErrors);
}
//colors
void fetchAllColors()
{
  Services.getData(apiURL: "getAll-colors").then((value)
  {
    var x  = value["data"];
    x = x.map((item)
    {
      item.remove("created_at");
      item.remove("updated_at");
      return item;
    }).toList();
    data.formValues = {"colors":x};
  }).catchError(HandleErrors);
}
//mountings
void fetchAllMountings()
{
  Services.getData(apiURL: "getAll-mountings").then((value)
  {
    var x  = value["data"];
    x = x.map((item)
    {
      item.remove("created_at");
      item.remove("updated_at");
      return item;
    }).toList();
    data.formValues = {"mountings":x};
  }).catchError(HandleErrors);
}
//protections
void fetchAllProtections()
{
  Services.getData(apiURL: "getAll-protections").then((value) {
    var x  = value["data"];
    x = x.map((item)
    {
      item.remove("created_at");
      item.remove("updated_at");
      return item;
    }).toList();
    data.formValues = {"protections": x};
  }).catchError(HandleErrors);
}
//feed-in
void fetchAllFeedIn()
{
  Services.getData(apiURL: "getAll-feedin").then((value)
  {
    var x  = value["data"];
    x = x.map((item)
    {
      item.remove("created_at");
      item.remove("updated_at");
      return item;
    }).toList();
    print(x);
    data.formValues = {"feedin":x};
  }).catchError(HandleErrors);
}
//feed-out
void fetchAllFeedOut()
{
  Services.getData(apiURL: "getAll-feedout").then((value)
  {
    var x  = value["data"];
    x = x.map((item)
    {
      item.remove("created_at");
      item.remove("updated_at");
      return item;
    }).toList();
    //print(x);
    data.formValues = {"feedout":x};
  }).catchError(HandleErrors);
}
//luminairs
void fetchAllLuminairs()
{
  Services.getData(apiURL: "getAll-luminairs").then((value)
  {
    var x  = value["data"];
    x = x.map((item)
    {
      item.remove("created_at");
      item.remove("updated_at");
      return item;
    }).toList();
    print(x);
    data.formValues = {"luminairs":x};
  }).catchError(HandleErrors);
}

 */
