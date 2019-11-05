import 'package:flutter/material.dart';
class BarcodeCalculator extends StatelessWidget {
  
  int currentNoProducts = 0;
  int futureNoProducts = 0;
  int barcodeTotal = 0;
  String initalFee = "";
  String annualFee = "";
  String capacity = "";

  @override
  Widget build(BuildContext context) {
    // Create first input field
    TextField currentProductsField = TextField(
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        try {
          currentNoProducts = int.parse(value);
        } catch (exception) {
          currentNoProducts = 0;
        }
      },
      decoration:
          InputDecoration(labelText: "Number of products need barcodes"),
    );

    // Create another input field
    TextField futureProductsField = TextField(
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        try {
          futureNoProducts = int.parse(value);
        } catch (exception) {
          futureNoProducts = 0;
        }
      },
      decoration:
          InputDecoration(labelText: "Future number of products need barcodes"),
    );

    calcInitialAnnual( barcodeTotal) {
    if(barcodeTotal == 0)
                {
                    initalFee = "";
                    annualFee = "";
                    capacity = "";
                  
                }
            if (barcodeTotal <= 10 && barcodeTotal > 0)
                {
                    initalFee = "250";
                    annualFee = "50";
                    capacity = "1 - 10";
                  
                }
            if (barcodeTotal <= 100 && barcodeTotal > 10)
                {
                    initalFee = "750";
                    annualFee = "150";
                    capacity = "1 - 100";
                   
                }
            if(barcodeTotal <= 1000 && barcodeTotal > 100)
                {
                    initalFee = "2,500";
                    annualFee = "500";
                    capacity = "1 - 1,000";
                  
                }
            if( barcodeTotal <= 10000 && barcodeTotal > 1000)
                {
                    initalFee = "6,500";
                    annualFee = "1,300";
                    capacity = "1 - 10,000";
                   
                }
            if( barcodeTotal <= 100000 && barcodeTotal > 10000)
                {
                    initalFee = "10,500";
                    annualFee = "2,100";
                    capacity = "1 - 100,000";
                 
                }
            if( barcodeTotal > 100000)
                {
                    initalFee = "-";
                    annualFee = "-";
                    capacity = "Contact us at 937.435.3870";
                   
                }
    }

    // Create button
    RaisedButton calculateButton = RaisedButton(
        child: Text("Calculate"),
        onPressed: () {
          // Calculate tip and total
          int totalBarCodesNeeded = currentNoProducts + futureNoProducts;
          calcInitialAnnual(totalBarCodesNeeded);

          // Generate dialog
          AlertDialog dialog = AlertDialog(
              content: Text("Total Barcodes Needed: $totalBarCodesNeeded \n"
                  "Prefix Capacity: $capacity \n"
                  "Initial Fee: $initalFee \n"
                  "Annual Renewal Fee: $annualFee \n"));

          // Show dialog
          showDialog(
              context: context, builder: (BuildContext context) => dialog);
        });

    Container container = Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          currentProductsField,
          futureProductsField,
          calculateButton
        ]));

    AppBar appBar = AppBar(title: Text("Barcode Estimator"));

    Scaffold scaffold = Scaffold(
      appBar: appBar, 
      body: container,
      resizeToAvoidBottomInset: false
      );
    return scaffold;
  }
}