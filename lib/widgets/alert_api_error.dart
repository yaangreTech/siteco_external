import 'package:flutter/material.dart';
import 'package:siteco_external/widgets/alert.dart';
import 'package:siteco_external/widgets/buttons.dart';
import 'package:siteco_external/widgets/restart_app.dart';

//function to trigger an alert when an error occures
void ApiAlert({required BuildContext context, required Map<String, dynamic> serverError})
{
  AlertBox(context: context, dismissible: false, child: SizedBox(
    height: 140,
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(serverError["status"].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
          Text("An error occured", style: TextStyle(fontSize: 22),),
          SizedBox(height: 25,),
          RedOutlinedButton(child: Text("Retry"), onPressed: ()
          {
            RestartWidget.restartApp(context);
          })
        ],
      ),
    ),
  ));
}