
import 'package:active_ecommerce_flutter/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'data_table_widget.dart';

class PaymentSummuryScreen extends StatefulWidget {
  @override
  State<PaymentSummuryScreen> createState() => _PaymentSummuryScreenState();
}

class _PaymentSummuryScreenState extends State<PaymentSummuryScreen> {
  bool value = false;
  bool values = false;
  bool value1 = false;


  final List<Map<String, String>> listOfColumns = [
    {
      "S.No.": "1",
      "Date & Time": "20/12/2022, 10:35:67",
      "Description": "T-SHIRT PURCHASED",
      "Quantity": "5",
      "Wallet": "Shopping Wallet",
      "Received ID & Name": "ADF5/SUMIT",
      "Credit": "\u{20B9} 2000",
      "Debit": "-",
      "Txd ID": "87667898767",
      "Remark": "Shopping",
    },
    {
      "S.No.": "2",
      "Date & Time": "20/09/2022, 10:35:67",
      "Description": "T-SHIRT PURCHASED",
      "Quantity": "6",
      "Wallet": "Shopping Wallet",
      "Received ID & Name": "ADF5/SUMIT",
      "Credit": "\u{20B9} 3000",
      "Debit": "-",
      "Txd ID": "87687898767",
      "Remark": "Shopping",
    },
    {
      "S.No.": "3",
      "Date & Time": "20/08/2022, 10:35:67",
      "Description": "T-SHIRT PURCHASED",
      "Quantity": "6",
      "Wallet": "Shopping Wallet",
      "Received ID & Name": "ADF5/SUMIT",
      "Credit": "\u{20B9} 6000",
      "Debit": "-",
      "Txd ID": "87687898767",
      "Remark": "Shopping",
    },
    {
      "S.No.": "4",
      "Date & Time": "20/04/2022, 10:35:67",
      "Description": "T-SHIRT PURCHASED",
      "Quantity": "6",
      "Wallet": "Shopping Wallet",
      "Received ID & Name": "ADF5/SUMIT",
      "Credit": "\u{20B9} 3000",
      "Debit": "-",
      "Txd ID": "87687898767",
      "Remark": "Shopping",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading:IconButton(onPressed:(){
            Navigator.pop(context);
          }, icon: Icon(
            FontAwesomeIcons.xmark,
            size: 20,
            color: Colors.grey[700],
          ),),
          iconTheme: IconThemeData(color: Colors.grey[700]),
          title: Text(
            "My Cart",
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          titleSpacing: 0.0,
          actions:  [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: IconButton(onPressed:(){
                Navigator.push(context,MaterialPageRoute(builder:(context)=>  Home()));
              }, icon: Icon(
                FontAwesomeIcons.home,
                color: Colors.grey,
                size: 17,
              ),)
            )
          ],
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            DataTableWidget(),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              width: MediaQuery.of(context).size.width,
              height: 152,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: Offset(1.0, 1.0),
                    blurRadius: 1.00,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "MY Wallet",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                        const Text(
                          "₹0.0",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Checkbox(
                          side:
                              const BorderSide(color: Colors.green, width: 1.5),
                          activeColor: Colors.green,
                          value: value,
                          onChanged: (value) {
                            setState(() {
                              this.value = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: Colors.grey[400],
                    thickness: 0.7,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Cash On Delivery",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Checkbox(
                          side:
                              const BorderSide(color: Colors.blue, width: 1.5),
                          value: values,
                          shape: const CircleBorder(),
                          onChanged: (value) {
                            setState(() {
                              values = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 0, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Pay Online",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Checkbox(
                          side:
                              const BorderSide(color: Colors.blue, width: 1.5),
                          value: value1,
                          shape: const CircleBorder(),
                          onChanged: (value) {
                            setState(() {
                              value1 = value;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: Offset(1.0, 1.0),
                    blurRadius: 1.00,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 15, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "MRP",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "₹20000",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 5, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Product Discount",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "-₹2000",
                          style: TextStyle(
                              color: Colors.green[300],
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 15,
                    indent: 14,
                    endIndent: 14,
                    color: Colors.grey[400],
                    thickness: 0.7,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, top: 10, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Total Amount",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "₹18000",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
              ,SizedBox(height:10,),
          
          ],
        ),
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: Colors.orange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Pay Now",style:TextStyle(color:Colors.white,fontSize:18,fontWeight:FontWeight.bold),),
              SizedBox(width:10,),
              Icon(FontAwesomeIcons.arrowRight,size:18,color:Colors.white,)
            ],
          ),
        ),
        );
  }
}
