import "package:flutter/material.dart";
var textStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold );

class WhatIS extends StatelessWidget {
  const WhatIS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // back button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(onPressed: ()
                {
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back)),
              ),
              SizedBox(height: 80,),
              // description
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("What is Licross Trunking System ?", style: textStyle,),
                    SizedBox(height: 40,),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Expanded(child: Text("""Our performance solution Licross® 11 is our innovative trunking system with maximum efficiency, service life and flexibility\n\nThe one-for-all concept offers a variety of luminaire inserts and functional expansion options for maximum flexibility and future compatibility. With its unique 14 cores, the rail system becomes the backbone of the building infrastructure and is ready for a wide range of applications - today and tomorrow.\n\nSimply create a complete configuration of a room with all the possibilities of the system""", style: TextStyle(fontSize: 18))),
                      ],
                    )
                  ],
                ),
              )


            ],
          ),
        )
      ),
    );
  }
}
