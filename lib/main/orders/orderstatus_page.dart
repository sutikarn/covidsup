import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderStatusPage extends StatefulWidget {
  @override
  _OrderStatusPageState createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(""),
            Text("ORDER STATUS"),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamedAndRemoveUntil("HomePage", (route) => false);
              },
              child: SvgPicture.asset(
                'assets/icons/icon_close.svg',
                color: Colors.white,
              ),
            )
          ],
        ),
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
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            index<4?SvgPicture.asset('assets/icons/verified.svg',height: 30,width: 30,):SvgPicture.asset('assets/icons/circle_white.svg'),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Order Placed")
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            index<4?SvgPicture.asset('assets/icons/line_rectangle.svg'):SizedBox(height: 10,),
                            SizedBox(
                              width: 35,
                            ),
                            Text(
                                "Your order #212423 was placed on \n 23thNovember 2019.")
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
