import 'package:flutter/material.dart';
import 'package:flutter_app/model/product_model.dart';
import 'package:hexcolor/hexcolor.dart';

import 'description_page.dart';
import 'reviews_product_page.dart';
import 'specifications_page.dart';

class AboutProductsDetailPage extends StatefulWidget {
  @override
  _AboutProductsDetailPageState createState() =>
      _AboutProductsDetailPageState();
}

class _AboutProductsDetailPageState extends State<AboutProductsDetailPage> {
  int i = 0;
  List<Widget> listwidget = [DescriptionPage(), SpecificationsPage(), ReviewsProductPage()];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DefaultTabController(
            length: 3, // length of tabs
            initialIndex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xffE4E4E7),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TabBar(
                          onTap: (int index) {
                            i = index;
                            setState(() {});
                          },
                          isScrollable: true,
                          indicatorColor: HexColor("#CC9D76"),
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: [
                            Tab(
                              child: Text(
                                "Description",
                                style: TextStyle(color: Colors.black,fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Specifications',
                                style: TextStyle(color: Colors.black,fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Reviews',
                                style: TextStyle(color: Colors.black,fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: listwidget[i],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
