import 'package:flutter/material.dart';
import 'package:siteco_external/widgets/buttons.dart';
import 'package:siteco_external/widgets/restart_app.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Cannot connect the client to the server.\nAn error occured while fetching data", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              SizedBox(width: 20,),
              Icon(Icons.error, size: 42,)
            ],
          ),
          SizedBox(height: 25,),
          RedOutlinedButton(child: Text("Retry"), onPressed: ()
          {
            RestartWidget.restartApp(context);
          })
        ],
      )
    );
  }
}
