import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/screens/product_card.dart';
import 'package:flutter/material.dart';

class CategoryWiseScreen extends StatefulWidget {
  const CategoryWiseScreen({Key key}) : super(key: key);

  @override
  State<CategoryWiseScreen> createState() => _CategoryWiseScreenState();
}

class _CategoryWiseScreenState extends State<CategoryWiseScreen> {
  ScrollController _scrollController = ScrollController();
  ScrollController _xcrollController = ScrollController();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                buildCategory(),
                Container(
                  margin: EdgeInsets.symmetric(vertical:5),
                  height: MediaQuery.of(context).size.height / 1.10,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 4.0,
                          // height: MediaQuery.of(context).size.height,
                          child: buildCategoryList()),
                      buildProductList(),
                      // Align(
                      //   alignment: Alignment.bottomCenter,
                      //   child: buildLoadingContainer(),
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: MyTheme.white,
        elevation: 2,
        titleSpacing: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(right: 15),
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: MyTheme.light_grey,
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              cursorColor: MyTheme.dark_grey,
              cursorHeight: 23,
              decoration: InputDecoration(
                  isCollapsed: true,
                  isDense: true,
                  contentPadding: EdgeInsets.only(left: 15, top: 10, bottom: 8),
                  suffixIcon: Icon(
                    Icons.search,
                    color: MyTheme.dark_grey,
                  ),
                  hintText: 'Search anything...',
                  border: InputBorder.none),
            ),
          ),
        ));
  }

  buildProductList() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.34,
      // color: Colors.amber,
      
      child: GridView.builder(
        itemCount: 10,
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // maxCrossAxisExtent: 150,
            crossAxisCount: 2,
            crossAxisSpacing: 0,  
            mainAxisSpacing: 0,
            childAspectRatio: 3 / 5),
        // padding: EdgeInsets.all(0),
        physics: BouncingScrollPhysics(),
        // shrinkWrap: true,
        itemBuilder: (context, index) {
          return ProductCard(
            id: 1, 
            image:
                "https://nvshoppe.thedigitalkranti.com/public/uploads/all/o7DXucyzPbnF9KjrzWDkhd39FSrWu2VxkzmRVq2j.jpg",
            name: "Nivea Cream",
            main_price: "500 ML",
            stroked_price: "₹250",
            subName: "Cream",
            addQunatity: "ADD",
            has_discount: true,

          );
        },
      ),
    );
  }
}

buildCategory() {
  return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, index) {
            return Container(
              height: 80,
              width: 100,
              margin: EdgeInsets.symmetric(horizontal: 3),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: MyTheme.medium_grey),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white70.withOpacity(0.5), //color of shadow
                    spreadRadius: 5, //spread radius
                    blurRadius: 7, // blur radius
                    offset: Offset(0, 2), // changes position of shadow
                    //first paramerter of offset is left-right
                    //second parameter is top to down
                  ),
                  //you can set more BoxShadow() here
                ],
              ),
              child: Text(
                "Choclate",
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            );
          }));
}

buildCategoryList() {
  return SingleChildScrollView(
    child: ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              // color: Colors.black,

              border: Border(
                right: BorderSide(
                  width: 2,
                  color: MyTheme.dark_grey,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: MyTheme.white,
                  spreadRadius: 1,
                  blurRadius: 20,
                  offset: const Offset(0, 20),
                ).scale(5)
              ],
            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/placeholder.png',
                    image:
                        "https://5.imimg.com/data5/NI/MA/HZ/SELLER-72734825/moisture-nivea-cream-500x500.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Catgeory",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
