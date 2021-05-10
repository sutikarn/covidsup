import 'package:flutter/material.dart';
import 'package:flutter_app/constants/constants.dart';
import 'package:flutter_app/widget/rippleanimation.dart';
import 'package:flutter_app/widget/widgetbtn.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class CheckYourEmailPage extends StatefulWidget {
  @override
  _CheckYourEmailPageState createState() => _CheckYourEmailPageState();
}

class _CheckYourEmailPageState extends State<CheckYourEmailPage> {
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
              child: SvgPicture.asset('assets/icons/icon_close.svg'),
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
                    RipplesAnimation('assets/icons/sendEmail.svg'),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Check your email",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(),
                    Text(
                        "We've sent you instructions on how to reset the \n password (also check the Spam folder)",
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
              SizedBox(
                height: 16.5,
              ),
              Buttondefault(
                message: "Open my mail client",
                color: HexColor(colorYellowGold),
                fuction: () {},
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

