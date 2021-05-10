import 'package:flutter/material.dart';
import 'package:flutter_app/constants/constants.dart';
import 'package:flutter_app/main/categories/categories_page.dart';
import 'package:flutter_app/model/product_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'store/products_details/products_details_page.dart';

class StoreMainPage extends StatefulWidget {
  StoreMainPage(this._controller);

  PageController _controller;

  @override
  _StoreMainPageState createState() => _StoreMainPageState();
}

class _StoreMainPageState extends State<StoreMainPage> with AutomaticKeepAliveClientMixin {
  var  productModel = productItem;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: Image.asset("assets/icons/icon_hamburger.png"),
            ),
            Text('STORE'),
            InkWell(
              onTap: () {
              },
              child: Image.asset("assets/icons/icon_search.png"),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
                  'Ottoman Collection',
                  style: TextStyle(fontSize: 26),
                ),
                Text(
                  'Find the perfect watch for your wrist ',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    InkWell(
                      onTap: (){
                       widget._controller.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                      },
                      child: Text('See all >>',
                          style: TextStyle(
                              fontSize: 16, color: HexColor("#CC9D76"))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productModel.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Image.asset(
                              productModel[index].imageProduct,
                              width: 150,
                              height: 150,
                            ),
                            Text(productModel[index].nameProduct,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                            Text(productModel[index].priceProduct,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TopDeals',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text('See all >>',
                        style: TextStyle(
                            fontSize: 16, color: HexColor("#CC9D76"))),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 230,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productModel.length,
                    itemBuilder: (context, index) {
                      return productModel[index].topdeal
                          ? Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 160,
                                    width: 315,
                                    decoration: BoxDecoration(
                                      borderRadius: new BorderRadius.all(
                                          Radius.circular(4)),
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomRight,
                                          end: Alignment.topLeft,
                                          colors: [
                                            const Color(0xff272833),
                                            const Color(0xff97571E),
                                          ]),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 30.5, top: 23.5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              "Gulcehre Ibrik",
                                              style: TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "W:32cm H:26cm",
                                            style:
                                                TextStyle(color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "€5650",
                                            style:
                                                TextStyle(color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: -20  ,
                                    bottom: 0,
                                    child: Image(
                                      image: AssetImage(
                                          productModel[index].imageProduct),
                                      height: 220,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container();
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Featured products',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    InkWell(
                      onTap: (){
                      },
                      child: Text('See all >>',
                          style: TextStyle(
                              fontSize: 16, color: HexColor("#CC9D76"))),
                    ),
                  ],
                ),
                Container(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productModel.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            SizedBox(height: 30,),
                            Image.asset(
                              productModel[index].imageProduct,
                              width: 150,
                              height: 150,
                            ),
                            Text(productModel[index].nameProduct,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                            Text(productModel[index].priceProduct,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search by brand',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text('See all >>',
                        style: TextStyle(
                            fontSize: 16, color: HexColor("#CC9D76"))),
                  ],
                ),
                Container(
                  height: 300,
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
                                    ProductsDetailsPage(productModel[index])),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              SizedBox(height: 30,),
                              Image.asset(
                                productModel[index].imageProduct,
                                width: 150,
                                height: 150,
                              ),
                              Text(productModel[index].nameProduct,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black)),
                              Text(productModel[index].priceProduct,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black)),
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
