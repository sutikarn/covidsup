import 'package:flutter/material.dart';
import 'package:flutter_app/constants/constants.dart';
import 'package:flutter_app/widget/rippleanimation.dart';
import 'package:flutter_app/widget/widgetbtn.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class OrderPlacePage extends StatefulWidget {
  @override
  _OrderPlacePageState createState() => _OrderPlacePageState();
}

class _OrderPlacePageState extends State<OrderPlacePage> {
  final height = 1 - kToolbarHeight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                top: kToolbarHeight,
                right: 50,
                child: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamedAndRemoveUntil("HomePage", (route) => true);
                      },
                      child: SvgPicture.asset('assets/icons/icon_close.svg')),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RipplesAnimation('assets/icons/verified.svg'),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                            "Your order #212423 was placed with success.\n You can see the status of the order at any time.",
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.5,
                  ),
                  Buttondefault(
                    message: "See order status",
                    color: HexColor(colorYellowGold),
                    fuction: () {
                      Navigator.of(context).pushNamedAndRemoveUntil("OrderStatusPage", (route) => true);
                    },
                  ),
                  SizedBox(
                    height: 16.5,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

