import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/screens/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';

import '../helpers/shimmer_helper.dart';
import '../repositories/category_wise_repository.dart';

class CategoryWiseScreen extends StatefulWidget {
  const CategoryWiseScreen({Key key}) : super(key: key);

  @override
  State<CategoryWiseScreen> createState() => _CategoryWiseScreenState();
}

class _CategoryWiseScreenState extends State<CategoryWiseScreen> {
  ScrollController _scrollController = ScrollController();
  ScrollController _xcrollController = ScrollController();
  final TextEditingController controller = TextEditingController();

  List<dynamic> _productList = [];
  bool _isInitial = true;
  int _page = 1;
  String _searchKey = "";
  int _totalData = 0;
  bool _showLoadingContainer = false;
  var selectedId;
  var selectedName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              physics: BouncingScrollPhysics(),
              // scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 8,
                ),
                buildCategory(),
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 5),
                //   height: MediaQuery.of(context).size.height / 1.10,
                //   // width: MediaQuery.of(context).size.width,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Card(
                //         elevation: 5,
                //         child: Container(
                //             width: MediaQuery.of(context).size.width / 4.4,
                //             color: Colors.white,
                //             child: buildSubCategoryList()),
                //       ),
                //       buildProductList(),
                //       SizedBox(
                //         height: MediaQuery.of(context).size.height / 1.10,
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: MyTheme.white,
      elevation: 1,
      titleSpacing: 0,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dairy & Breakfast",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                height: 1.2,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "330 Products",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 10,
                height: 1.2,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Icon(
            Icons.search,
            color: MyTheme.dark_grey,
          ),
        ),
      ],
    );
  }

  buildProductList() {
    if (_isInitial && _productList.length == 0) {
      return SingleChildScrollView(
          child: ShimmerHelper()
              .buildProductGridShimmer(scontroller: _scrollController));
    } else if (_productList.length > 0) {
      return Container(
        width: MediaQuery.of(context).size.width / 1.35,
        child: GridView.builder(
          itemCount: 50,
          controller: _scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // maxCrossAxisExtent: 150,
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 5,
              childAspectRatio: 3 / 5),
          // padding: EdgeInsets.all(0),
          physics: BouncingScrollPhysics(),
          // shrinkWrap: true,
          itemBuilder: (context, index) {
            return ProductCard(
              id: _productList[index].id,
              image: _productList[index].thumbnail_image,
              name: _productList[index].name,
              main_price: "500 ML",
              stroked_price: _productList[index].main_price,
              subName: "Toned Fresh Milk",
              stroked_price_underline: _productList[index].stroked_price,
              addQunatity: "ADD  +",
              has_discount: true,
            );
          },
        ),
      );
    } else if (_totalData == 0) {
      return Center(
          child: Text(AppLocalizations.of(context).common_no_data_available));
    } else {
      return Container(); // should never be happening
    }
  }
}

buildCategory() {
  var future = CategoryWiseRepository().getAllCategories();
  return FutureBuilder(
      future: future,
      // ignore: missing_return
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          //snapshot.hasError
          print("category list error");
          print(snapshot.error.toString());
          return Container(
            height: 10,
          );
        } else if (snapshot.hasData) {
          //snapshot.hasData
          var categoryWiseResponse = snapshot.data;
          // selectedId = categoryResponse.categories.first.id.toString();
          // selectedName = categoryResponse.categories.first.name.toString();
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 6),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryWiseResponse.data.length,
                    physics: BouncingScrollPhysics(),
                    // shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        height: 120,
                        width: 120,
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: MyTheme.medium_grey),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white70
                                  .withOpacity(0.5), //color of shadow
                              spreadRadius: 5, //spread radius
                              blurRadius: 7, // blur radius
                              offset:
                                  Offset(0, 2), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                            //you can set more BoxShadow() here
                          ],
                        ),
                        child: Text(
                          categoryWiseResponse.data[index].name.toString(),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        ),
                      );
                    })),
          );
        }
      });
}

buildSubCategoryList(index) {
  var future = CategoryWiseRepository().getAllCategories();

  return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          //snapshot.hasError
          print("category list error");
          print(snapshot.error.toString());
          return Container(
            height: 10,
          );
        } else if (snapshot.hasData) {
          //snapshot.hasData
          var categoryWiseResponse = snapshot.data;
          // selectedId = categoryResponse.categories.first.id.toString();
          // selectedName = categoryResponse.categories.first.name.toString();

          return SingleChildScrollView(
            child: ListView.builder(
              itemCount: categoryWiseResponse.data[index].categorize.length,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,position) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5, top: 5),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/placeholder.png',
                              image:
                                  categoryWiseResponse.data[index].categorize[position].icon.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              categoryWiseResponse.data[index].categorize[position].name.toString(),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 5,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            )),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        }else {
            return SingleChildScrollView(
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5,
                    ),
                    child: Shimmer.fromColors(
                      baseColor: MyTheme.shimmer_base,
                      highlightColor: MyTheme.shimmer_highlighted,
                      child: Container(
                        height: 100,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            );
          }
      });
}
