import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProductCard extends StatefulWidget {
  int id;
  String image;
  String name;
  String subName;
  String main_price;
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
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return ProductDetails(
        //     id: widget.id,
        //   );
        // }));
      },
      child: Card(
        
        margin: EdgeInsets.only(right:5),
        //clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          // side: new BorderSide(color:Colors.grey, width:0.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 3.0,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: double.infinity,
                  // height: 80,
                  //height: (( MediaQuery.of(context).size.width - 28 ) / 2) + 2,
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
                      padding: EdgeInsets.fromLTRB(8, 5, 16, 0),
                      child: Text(
                        widget.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            height: 1.2,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
                      child: Text(
                        widget.subName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            height: 1.2,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
                      child: Text(
                        widget.main_price,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 8, 16, 8),
                          child: Text(
                            widget.stroked_price,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                // decoration: TextDecoration.lineThrough,
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                             Container(
                               height: 25,
                               width: 60,
                               decoration: BoxDecoration(
                                 borderRadius:BorderRadius.circular(10),
                                 color: Colors.green
                               ),
                               child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                  //  Icon(FontAwesome.minus,color: Colors.white,size:10),
                                   Text(
                                   widget.addQunatity,
                                   textAlign: TextAlign.left,
                                   overflow: TextOverflow.ellipsis,
                                   maxLines: 1,
                                   style: TextStyle(
                                      //  decoration: TextDecoration.lineThrough,
                                       color: Colors.grey[200],
                                       fontSize: 11,
                                       fontWeight: FontWeight.w600),
                             ),
                                  //  Icon(FontAwesome.plus,color: Colors.white,size:10),

                                 ],
                               ),
                             ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
