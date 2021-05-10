import 'package:flutter/material.dart';
import 'package:flutter_app/login/login_page.dart';
import 'package:flutter_app/main/home_page.dart';
import 'package:flutter_app/services/google_login_service.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/MysticalVase.png",width: 200,height: 200,),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '€3150',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'hıstory Culture glass ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Mystical Vase',
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
                Text(
                  'Limited Edition',
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: double.maxFinite,
                  child: FlatButton(
                    onPressed: (){
                      GoogleLoginService().checkFirebaseLogin().then((status){
                        if(status){
                          Navigator.of(context).pushNamedAndRemoveUntil("HomePage", (route) => false);
                        }
                        else {
                          Navigator.of(context).pushNamedAndRemoveUntil("Login", (route) => false);
                        }
                      });
                    },
                    child: Text('SIGN IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: double.maxFinite,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.yellow[800],
                    child: Text(
                      "MASTER BUTTON",
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
              ]),
        ));
  }
}
