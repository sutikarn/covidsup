import 'package:flutter/material.dart';
import 'package:flutter_app/constants/constants.dart';
import 'package:flutter_app/extention/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  var productModel = productItem;
  bool stateDelete = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/icons/icons_search.svg',
              width: 20.w,
              color: Colors.white,
            ),
            Text(
              "Favorites",
              style: g16,
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    if (stateDelete) {
                      stateDelete = false;
                    } else {
                      stateDelete = true;
                    }
                  });
                },
                child: stateDelete
                    ? SvgPicture.asset('assets/icons/trash.svg',
                        width: 20.w, color: Colors.white)
                    : SvgPicture.asset('assets/icons/icon_close.svg',
                        width: 20.w, color: Colors.white)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.maxFinite,
              color: Colors.black,
              child: Text(
                'Seems like you don’t have any item\nin your favorite list.',
                style: g16,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
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
                child: Column(
                  children: [
                    Text(
                      "Products you might like",
                      style: b16,
                    ),
                    Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: productModel.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 250.w / 300.h,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  child: Column(
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
                                            bottom: 0,
                                            child: stateDelete
                                                ? SvgPicture.asset(
                                                    'assets/icons/icon_fav.svg',
                                                    width: 30.w,
                                                  )
                                                : SvgPicture.asset(
                                                    'assets/icons/trash.svg',
                                                    color: Colors.red,
                                                    width: 20.w,
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
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 57.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
