import 'package:flutter/material.dart';
import 'package:siteco_external/api/services.dart';
import 'package:siteco_external/functions/global_data.dart';

GlobalData data = GlobalData();

void fetchAllWirings({required Function callback})
{
  Services.getData(apiURL: "getAll-wirings").then((value)
  {
    if(value["status"]=="200")
    {
      var x = value["data"].map((item)=>item["name"]).toList();
      callback(x);
    }
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