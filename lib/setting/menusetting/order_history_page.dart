import 'package:flutter/material.dart';
import 'package:flutter_app/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(orderHistory),
      ),
      body: Container(
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
          child: ListView.builder(
              itemCount: orderHistoryModel.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("ORDER ${orderHistoryModel[index].order}"),
                              Text('View Details',style: TextStyle(color: HexColor(colorYellowGold))),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Placed On: ${orderHistoryModel[index].placedOn}"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "Amount: ${orderHistoryModel[index].amount}"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "Status: ${orderHistoryModel[index].status}"),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Divider(
                          thickness: 1,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
