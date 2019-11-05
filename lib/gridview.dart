import 'dart:io';

import 'package:flutter/material.dart';

class GridViewApp extends StatelessWidget {
  final MyGridView myGridView = MyGridView();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("GridView Example"),
        ),
        body: myGridView.build(),
      ),
    );
  }
}
class MyGridView {
   
  Card getStructuredGridCell(name, image) {
    return Card(
        elevation: 1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,          
          children: <Widget>[
            Image(image: AssetImage( image)),                       
            Center(
              child: Text(name),
              
            )
          ],
          
          //children: _getTiles(_imageList),
        ));
  }


  GridView build() {
    return GridView.count(
      primary: true,
      padding: const EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: <Widget>[       
             
         getStructuredGridCell("MembersPortal", "images/MembersPortal.png"),         
         getStructuredGridCell("UserPortal", "images/UserPortal.png"),       
         getStructuredGridCell("SPFinder", "images/SPFinder.png"), 
         getStructuredGridCell("Barcode Estimator", "images/Barcode.png"),
         getStructuredGridCell("DataHub", "images/DataHub.png"),      
         getStructuredGridCell("DataHub", "images/DataHub.png"), 
      ],
    );
  }
}
