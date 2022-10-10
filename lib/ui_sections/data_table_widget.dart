import 'package:flutter/material.dart';

class DataTableWidget extends StatelessWidget {
  final List<Map<String, String>> listOfColumns = [
    {
      "Items": "Fortune Soya Health Refined Soyabean Oil5 Liter 5 ltr",
      "Variant": "5 Liter",
      "Qty": "5",
      "Price": "₹899",
      "Total": "₹4495.0",
    
    },
    {
      "Items": "Fortune Rice Bran\nHealth Refined 5ltr",
      "Variant": "5 Liter",
      "Qty": "1",
      "Price": "₹940",
      "Total": "₹940.0",
   
    },
    {
      "Items": "Bail Kohlu Mustard\nOil 5ltr",
      "Variant": "5 Liter",
      "Qty": "1",
      "Price": "₹810",
      "Total": "₹810.0",
    
    },
    {
      "Items": "Kanodia Mustard Oil\n5ltr",
      "Variant": "5 Liter",
      "Qty": "1",
      "Price": "₹869",
      "Total": "₹869.0",
    
    },
     {
      "Items": "Fortune Kacchi Ghani\nMustard Oil 5ltr",
      "Variant": "5 Liter",
      "Qty": "1",
      "Price": "₹849",
      "Total": "₹849.0",
    
    },
       {
      "Items": "Patanjali Mustard Oil\n5ltr",
      "Variant": "5 Liter",
      "Qty": "1",
      "Price": "₹826",
      "Total": "₹826.0",
    
    },
        {
      "Items": "Haryana Ghee 1ltr",
      "Variant": "1 Liter",
      "Qty": "1",
      "Price": "₹340",
      "Total": "₹340.0",
    
    },
  ];
//  DataTableWidget(this.listOfColumns);     // Getting the data from outside, on initialization
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height / 1.0,
      decoration: BoxDecoration(
        border: Border.all(width: 0.6, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left:10,top:10),
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[200],
            child: const Text("Order Summary",style:TextStyle(color:Colors.black,fontSize:16,fontWeight:FontWeight.bold))),
          DataTable(
            dataRowHeight:45,
            headingRowHeight:50,
            columnSpacing:11,
            horizontalMargin:10,
            decoration: BoxDecoration(
                color: Colors.grey[700],
                // border: Border.all(color: Colors.black, width: 0.5),
                ),
            headingTextStyle:
                const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            columns:const [
              DataColumn(label: Text('Items')),
              DataColumn(label: Text('Variant')),
              DataColumn(label: Text('Qty')),
              DataColumn(label: Text('Price')),
              DataColumn(label: Text('Total')),
     
            ],
            rows:
                listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
                    .map(
                      ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(Text(element["Items"].toString())),
                              DataCell(Text(element["Variant"].toString())),
                              DataCell(Text(element["Qty"].toString())),
                              DataCell(Text(element["Price"].toString())),
                              DataCell(Text(element["Total"].toString())),
                            ],
                          )),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
