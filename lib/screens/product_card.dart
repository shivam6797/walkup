import 'package:active_ecommerce_flutter/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProductCard extends StatefulWidget {
  int id;
  String image;
  String name;
  String subName;
  String main_price;
  String stroked_price_underline;
  String stroked_price;
  String addQunatity;
  bool has_discount;
  ProductCard(
      {Key key,
      this.id,
      this.has_discount,
      this.image,
      this.main_price,
      this.name,
      this.stroked_price,
      this.stroked_price_underline,
      this.subName,
      this.addQunatity,
      })
      : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
      print((MediaQuery.of(context).size.width - 48) / 2);
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductDetails(
            id: widget.id,
          );
        }));
      },
      child: Container(
        width: 100,
        margin: EdgeInsets.symmetric(horizontal:2),
        decoration:BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: Offset(5.0, 5.0),
                    blurRadius: 5.00,
                    spreadRadius: 5.0,
                  ),
                ],
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: double.infinity,
                  // height: 100,
                  // margin: EdgeInsets.only(bottom:40),
                  // color: Colors.amber,
                  height: (( MediaQuery.of(context).size.width - 150 ) / 2) + 2,
                  child: ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16), bottom: Radius.zero),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/placeholder.png',
                        image: widget.image,
                        fit: BoxFit.cover,
                      ))),
              Container(
                // height: 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
                      child: Text(
                        widget.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            height: 1.2,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
                      child: Text(
                        widget.subName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            height: 1.2,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 9, 16, 0),
                      child: Text(
                        widget.main_price,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,18,0,0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.stroked_price,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    // decoration: TextDecoration.lineThrough,
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height:1,),
                               Text(
                                widget.stroked_price_underline,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey[500],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                     
                               Container(
                                 height: 25,
                                 width: 70,
                                 decoration: BoxDecoration(
                                   borderRadius:BorderRadius.circular(5),
                                   color: Colors.green[50],
                                   border: Border.all(color: Colors.green,width:0.5)
                                 ),
                                 child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text(
                                     widget.addQunatity,
                                     textAlign: TextAlign.left,
                                     overflow: TextOverflow.ellipsis,
                                     maxLines: 1,
                                     style: TextStyle(
                                        //  decoration: TextDecoration.lineThrough,
                                         color: Colors.green,
                                         fontSize: 11,
                                         fontWeight: FontWeight.w600),
                               ),
                                    //  Icon(FontAwesome.plus,color: Colors.white,size:10),

                                   ],
                                 ),
                               ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
