import 'package:flutter/material.dart';
import 'package:flutter_app/constants/constants.dart';
import 'package:flutter_app/login/login_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookLogin facebookLogin = FacebookLogin();
  final User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(user.displayName),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Container(
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            image: user.photoURL != null
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(user.photoURL),
                                  )
                                : null,
                          ),
                          child: Center(
                            child: user.photoURL != null
                                ? null
                                : SvgPicture.asset(
                                    'assets/icons/ua_ico.svg',
                                    width: 34,
                                    height: 34,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: HexColor(colorYellowGold),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                                child: SvgPicture.asset(
                              'assets/icons/camera.svg',
                              width: 14,
                              height: 14,
                              color: Colors.white,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    user.displayName ?? "Ugur Ates",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 1),
                  Text(
                    user.email ?? "ugurates19@gmail.com",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  menuSetting("Order History"),
                  underLine(w),
                  menuSetting("My Addresses"),
                  underLine(w),
                  menuSetting("My Cards"),
                  underLine(w),
                  menuSetting("Vouchers"),
                  underLine(w),
                  menuSetting("Nearby Stores"),
                  underLine(w),
                  menuSetting("Latest Articles"),
                  underLine(w),
                  menuSetting("Settings"),
                  underLine(w),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.all(26),
                    child: Container(
                      height: 50,
                      width: double.maxFinite,
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.yellow[800],
                        child: Text("Log Out"),
                        onPressed: () {
                          _signOutGoogle();
                        },
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding underLine(double w) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Divider(
        thickness: 1,
        height: 0,
      ),
    );
  }

  InkWell menuSetting(String menuName) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(menuName, (route) => true);
      },
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              menuName,
              style: TextStyle(fontSize: 16),
            ),
            SvgPicture.asset(
              'assets/icons/arrow_right.svg',
              width: 12,
              height: 12,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }

  void _signOutGoogle() async {
    await _googleSignIn.signOut().then((value) {

    }).catchError((e) => print(e));

    await facebookLogin.logOut().then((value) => {

    }).catchError((e) => print(e));

    FirebaseAuth.instance.signOut().then((value) => {
      Navigator.of(context).pushNamedAndRemoveUntil("Splash", (route) => false)
    });
  }
}
