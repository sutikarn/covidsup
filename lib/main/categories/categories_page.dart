import 'package:flutter/material.dart';
import 'package:flutter_app/constants/constants.dart';
import 'package:flutter_app/extention/text_style.dart';
import 'package:flutter_app/main/store/products_details/products_details_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage(PageController controller);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  var productModel = productItem;
  bool showSeeAll = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset("assets/icons/icon_hamburger.png"),
              ),
              Text('Categories'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
//                  InkWell(
//                    onTap: () {},
//                    child: SvgPicture.asset(
//                      "assets/icons/icon_filter.svg",
//                      color: Colors.white,
//                    ),
//                  ),
//                  SizedBox(
//                    width: 20,
//                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset("assets/icons/icon_search.png"),
                  ),
                ],
              )
            ],
          ),
          backgroundColor: Colors.black,
        ),
        body: showSeeAll
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: double.maxFinite,
                color: Colors.black,
                child: new Container(
                  padding: EdgeInsets.all(16),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Ottoman Collection\nClassic Collections',
                          style: b20,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Search through more than 1000+ watches',
                          style: g16,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Limited Edition',
                              style: b20,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  showSeeAll = false;
                                });
                              },
                              child: Text('See all >>',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: HexColor("#CC9D76"))),
                            ),
                          ],
                        ),
                        Container(
                          height: 250.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: productModel.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductsDetailsPage(
                                                productModel[index])),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Stack(
                                        children: [
                                          Image.asset(
                                            productModel[index].imageProduct,
                                            width: 150,
                                            height: 150,
                                          ),
                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                  color:
                                                      HexColor(colorYellowGold),
                                                  borderRadius:
                                                      new BorderRadius.only(
                                                    bottomLeft:
                                                        const Radius.circular(
                                                            4),
                                                    topRight:
                                                        const Radius.circular(
                                                            4),
                                                  )),
                                              padding: EdgeInsets.all(4),
                                              child: Text(
                                                "-50%",
                                                style: b16,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            bottom: 0,
                                            child: SvgPicture.asset(
                                              'assets/icons/icon_fav.svg',
                                              width: 30.w,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(productModel[index].nameProduct,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black)),
                                      Text(productModel[index].priceProduct,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 44.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Add a Signature\nto Your Look",
                            style: b16,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                              "The latest styles of men's leather watches",
                              style: b16,
                              textAlign: TextAlign.center),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: productModel.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 211.w / 250.h,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          '${productModel[index].imageProduct}'),
                                      height: 150.h,
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 10.h,
                                      child: Container(
                                        decoration: new BoxDecoration(
                                            color: HexColor(colorYellowGold),
                                            borderRadius: new BorderRadius.only(
                                              bottomLeft:
                                                  const Radius.circular(4),
                                              topRight:
                                                  const Radius.circular(4),
                                            )),
                                        padding: EdgeInsets.all(4),
                                        child: Text(
                                          "-50%",
                                          style: b16,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: SvgPicture.asset(
                                        'assets/icons/icon_fav.svg',
                                        width: 30.w,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10.5.h,
                                ),
                                Text(
                                  productModel[index].nameProduct,
                                  style: b16,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  productModel[index].priceProduct,
                                  style: b16,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(
                          height: 57.h,
                        ),
                      ],
                    ),
                    Positioned(
                      top: 10.h,
                      left: 10.w,
                      child: Material(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        color: Colors.transparent,
                        child: IconButton(
                          color: Colors.grey.withOpacity(0.5),
                          splashRadius: 20,
                          onPressed: () {
                            setState(() {
                              showSeeAll = true;
                            });
                          },
                          splashColor: HexColor(colorYellowGold),
                          highlightColor: Colors.transparent,
                          icon: Icon(Icons.arrow_back),
                        ),
                      ),
                    )
                  ],
                ),
              ));
  }
}
