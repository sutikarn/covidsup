import 'package:flutter/material.dart';
import 'package:flutter_app/constants/constants.dart';
import 'package:flutter_app/extention/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class OrderDetailPage extends StatefulWidget {
  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  var productModel = productItem;
  var groupShipping = "";
  void groupShippingController(String string) {
    setState(() {
      groupShipping = string;
      print(string);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Order Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
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
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Shipping To"),
                          InkWell(
                            child: Text("Change"),
                            onTap: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "NewMyAddressesPage", (route) => true);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Dereboyu Cad. 23,\n34410 - Istanbul/Türkiye",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Divider(
                          thickness: 1,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("PAY WITH CREDIT CARD"),
                          InkWell(
                            child: Text("Change"),
                            onTap: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "NewMyAddressesPage", (route) => true);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "XXXX - XXXX - XXXX - 9123",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Divider(
                          thickness: 1,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("ORDER DETAILS"),
                      Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: productModel.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Image(
                                  image: AssetImage(
                                      '${productModel[index].imageProduct}'),
                                  height: 200,
                                ),
                                title: Text(
                                  "${productModel[index].nameProduct}",
                                ),
                                subtitle:
                                    Text("${productModel[index].priceProduct}"),
                                onTap: () {
                                  Text('Another data');
                                },
                              );
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Divider(
                          thickness: 1,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "SHipping Method",
                        style: b16,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  activeColor: HexColor(colorYellowGold),
                                  value: "Standard",
                                  groupValue: groupShipping,
                                  onChanged: (String sting) {
                                    groupShippingController(sting);
                                  }),
                              Text("Standard Shipping (16 days)"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("FREE"),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                activeColor: HexColor(colorYellowGold),
                                  value: "Express",
                                  groupValue: groupShipping,
                                  onChanged: (String sting) {
                                    groupShippingController(sting);
                                  }),
                              Text("Express (8 days)"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("€40"),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  activeColor: HexColor(colorYellowGold),
                                  value: "Premium",
                                  groupValue: groupShipping,
                                  onChanged: (String sting) {
                                    groupShippingController(sting);
                                  }),
                              Text("Premium (1 day)"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("€80"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.maxFinite,
              color: Colors.white,
              child: new Container(
                padding: EdgeInsets.all(16),
                decoration: new BoxDecoration(
                  color: Colors.black,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subtotal", style: g16),
                          Text(
                            "€13.650",
                            style: w16,
                          ),
                        ]),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Shipping", style: g16),
                        Text("Please select", style: w16),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total to Pay", style: g16),
                        Text("€13.650", style: w16),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width:MediaQuery.of(context).size.width*0.8,
                      height: 50,
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: HexColor(colorYellowGold),
                        child: Text(
                          "Place Order",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil("LoadingPage", (route) => false);
                        },
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
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
