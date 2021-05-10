import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/constants/constants.dart';
import 'package:flutter_app/model/product_model.dart';
import 'package:hexcolor/hexcolor.dart';

import 'about_products_detail_page.dart';

class ProductsDetailsPage extends StatefulWidget {
  ProductsDetailsPage(this.productModel);

  ProductModel productModel;

  @override
  _ProductsDetailsPageState createState() => _ProductsDetailsPageState();
}

class _ProductsDetailsPageState extends State<ProductsDetailsPage> {
  bool show = true;
  var  productModel = productItem;
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/icons/arrow_back_colorblack.png"),
            ),
            Text(
              'Product details',
              style: TextStyle(color: Colors.black),
            ),
            InkWell(
              onTap: () {},
              child: Image.asset("assets/icons/shopping_back_icon.png"),
            ),
          ],
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification){
          setState(() {
            if (scrollNotification is ScrollStartNotification) {
              show = true;
            } else if (scrollNotification is ScrollUpdateNotification) {
              show = false;
            } else if (scrollNotification is ScrollEndNotification) {
              show = true;
            }
          });
          return true;
        },
        child: Container(
          child: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.black,
                  width: double.maxFinite,
                  height: 200,
                  child: Image.asset(widget.productModel.imageProduct),
                ),
                Expanded(
                  child: Container(
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
                        controller: _scrollController,
                        child: Column(
                          children: [
                            Text(
                              widget.productModel.nameProduct,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 28),
                            ),
                            SizedBox(
                              height: 26,
                            ),
                            Text(
                              "1.248 Reviews",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 26,
                            ),
                            Text(
                              "The Virgin Mary in the “Deesis” scene in the south \n gallery of Hagia Sophia is depicted on the Hagia \n Sophia Mosaic Vase.",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 26,
                            ),
                            Text(
                              widget.productModel.priceProduct,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 28,color: HexColor("#CC9D76")),
                            ),
                            SizedBox(
                              height: 26,
                            ),
                            Column(
                              children: [
                                AboutProductsDetailPage(),
                                SizedBox(
                                  height: 27,
                                ),
                                Text(
                                  "Similar products",
                                  style: TextStyle(color: Colors.black, fontFamily: 'avenirH', fontSize: 24),
                                ),
                                Container(
                                  padding: EdgeInsets.all(16),
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
                                        child: Container(
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            show ? AnimatedPositioned(
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 300),
              bottom: show ? 15 : 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF7F7F7),
                    ),
                    child: Center(
                        child: Icon(Icons.bookmark_border
                    )),
                  ),
                  SizedBox(
                    width: 9.5,
                  ),
                  Container(
                    height: 50,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: HexColor("#CC9D76"),
                      child: Text(
                        "ADD TO CART",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {

                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 9.5,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF7F7F7),
                    ),
                    child: Center(
                        child: Image.asset(
                      'assets/icons/arrow_back_colorblack.png',
                      height: 14,
                      width: 14,
                    )),
                  ),
                ],
              ),
            ):Container(),
          ]),
        ),
      ),
    );
  }
}
