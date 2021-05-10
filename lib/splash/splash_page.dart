import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/intro/intro_page.dart';
import 'package:flutter_app/services/google_login_service.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
  final String title = "Carousel Demo";
}

class _SplashPageState extends State<SplashPage> {
  CarouselSlider carouselSlider;
  int _current = 0;
  List<Widget> widgetList = [SplashPage1(), SplashPage2(), IntroPage()];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(widgetList, (index, url) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? Colors.redAccent : Colors.grey,
                ),
              );
            }),
          ),
          Expanded(
            child: new Swiper(
              itemCount: widgetList.length,
              loop: false,
              autoplay: false,
              onIndexChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return widgetList[index];
              },
            ),
          )
        ]),
      ),
    );
  }
}

class SplashPage1 extends StatelessWidget {
  const SplashPage1({Key key}) : super(key: key);

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
                Image.asset("assets/images/Gulcehre_ibrik.png",width: 200,height: 200,),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '500B',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'HISTORY CULTURE GLASS ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Gülçehre İbrik',
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
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.yellow[800],
                    child: Text("MASTER BUTTON"),
                    onPressed: () {
                      GoogleLoginService().checkFirebaseLogin().then((status){
                        if(status){
                          Navigator.of(context).pushNamedAndRemoveUntil("HomePage", (route) => false);
                        }
                        else {
                          Navigator.of(context).pushNamedAndRemoveUntil("Login", (route) => false);
                        }
                      });
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

class SplashPage2 extends StatelessWidget {
  const SplashPage2({Key key}) : super(key: key);


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
              Text(
                'hıstory Culture glass',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Hagia Sophia ',
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
              Text(
                'Deesis Mosaic Vase',
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '€3450',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset("assets/images/SoteriaVazo.png",width: 200,height: 200,),
              Container(
                height: 50,
                width: double.maxFinite,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.yellow[800],
                  child: Text("MASTER BUTTON"),
                  onPressed: () {

                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}


