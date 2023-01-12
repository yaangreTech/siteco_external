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
    //protections
    _data.addAll({"protections": await fetchComponent(apiURL: "getAll-protections")});

    if(errorsStack.isEmpty)
    {
      return {"data": _data};
    }
    else
    {
      throw Exception("An error occurred while fetching data");
    }
  }
  catch (e)
  {
    return Future.error(errorsStack);
  }

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