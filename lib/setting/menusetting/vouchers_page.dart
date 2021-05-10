import 'package:flutter/material.dart';
import 'package:flutter_app/constants/constants.dart';
class VouchersPage extends StatefulWidget {
  @override
  _VouchersPageState createState() => _VouchersPageState();
}

class _VouchersPageState extends State<VouchersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("vouchers"),
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
          child: Container(
            padding: EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ACTIVE VOUCHERS"),
                  SizedBox(height: 20,),
                  vouchers("Boutique Discount", "Valid until February 2020", 20,false),
                  SizedBox(height: 20,),
                  vouchers("Boutique Discount", "Valid until February 2020", 20,false),
                  SizedBox(height: 20,),
                  vouchers("Boutique Discount", "Valid until February 2020", 20,false),
                  SizedBox(height: 20,),
                  Text("USED VOUCHERS"),
                  SizedBox(height: 20,),
                  vouchers("Boutique Discount", "Valid until February 2020", 20,true),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

LayoutBuilder vouchers(
    String title, String subTitle, int percent,bool statusVouchers) {
  return LayoutBuilder(builder: (context, constraints) {
    return Container(
      foregroundDecoration: BoxDecoration(
        color: statusVouchers?Colors.white.withOpacity(0.5):Colors.white.withOpacity(0),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          Container(
            width: constraints.constrainWidth() * 0.67,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xffF7F7F7),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 24, right: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                  ),
                  Text(
                    subTitle,
                  )
                ],
              ),
            ),
          ),
          Container(
            width: constraints.constrainWidth()*0.03,
            height: 100,
            color: Color(0xffF7F7F7),
            child: Column(
              children: [
                SizedBox(
                  height: 4,
                  width: 10,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Flex(
                        children: List.generate(
                          (constraints.constrainHeight() / 8).floor(),
                              (index) => SizedBox(
                            height: 4,
                            width: 1,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2)),
                            ),
                          ),
                        ),
                        direction: Axis.vertical,
                        mainAxisSize:MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: 4,
                  width: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: constraints.constrainWidth()*0.30,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                "$percent%",
              ),
            ),
          )
        ],
      ),
    );
  });
}
