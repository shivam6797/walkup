import 'package:active_ecommerce_flutter/ui_sections/payment_summury.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SnappingSheetWidget extends StatefulWidget {
  const SnappingSheetWidget({Key key}) : super(key: key);

  @override
  State<SnappingSheetWidget> createState() => _SnappingSheetWidgetState();
}

class _SnappingSheetWidgetState extends State<SnappingSheetWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final ScrollController listViewController = ScrollController();

    return Container(
      color: Colors.grey[200],
      child: Stack(
        children: [
          ListView.builder(
              controller: listViewController,
              padding: EdgeInsets.zero,
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                    padding: EdgeInsets.zero,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 0.5),
                    ),
                    height: 60,
                    child: ListTile(
                      dense: true,
                      horizontalTitleGap: 0,
                      minVerticalPadding: 0,
                      minLeadingWidth: 0,
                      leading: Container(
                        margin: const EdgeInsets.only(right: 10),
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            image: const DecorationImage(
                                image:
                                    AssetImage("assets/red_bulls.png"))),
                      ),
                      title: const Text("Red Bull",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text("1 Pack",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Prcie ₹ 100",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      trailing: Wrap(
                        spacing: 15,
                        verticalDirection: VerticalDirection.down,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (count > 0) {
                                    count--;
                                  }
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.circleMinus,
                                color: Colors.grey[700],
                                size: 20,
                              )),
                          Text(
                            count.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  count++;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.circlePlus,
                                color: Colors.grey[700],
                                size: 20,
                              )),
                          const Text("₹ 100",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                          const Icon(
                            FontAwesomeIcons.trash,
                            color: Colors.red,
                            size: 20,
                          ),

                          // icon-2
                        ],
                      ),
                    ));
              }),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height / 3.1,
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 7.9,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(5.0, 5.0),
                    blurRadius: 5.00,
                    spreadRadius: 5.0,
                  ), //BoxShadow
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(239, 239, 239, 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                             PaymentSummuryScreen()));
                              },
                              child: Material(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(80),
                                    topRight: Radius.circular(100),
                                    bottomLeft: Radius.circular(80),
                                    bottomRight: Radius.circular(100),
                                  ),
                                ),
                                elevation: 2,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.9,
                                  height: 70,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(80),
                                      topRight: Radius.circular(100),
                                      bottomLeft: Radius.circular(80),
                                      bottomRight: Radius.circular(100),
                                    ),
                                  ),
                                  child:
                                      Image.asset("assets/cbimage.png"),
                                ),
                              ),
                            ),
                            Container(
                              width: 80,
                              padding: const EdgeInsets.only(left: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Icon(
                                    FontAwesomeIcons.cartShopping,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '\$30.2',
                                    style: TextStyle(
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.trash,
                            color: Colors.grey[700],
                            size: 18,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Clear Cart",
                            style: TextStyle(color: Colors.grey, fontSize: 8),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "1",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          const Text(
                            "Total Items",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 8,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
