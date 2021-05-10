import 'package:flutter/material.dart';
import 'package:flutter_app/constants/constants.dart';

class MyAddressesPage extends StatefulWidget {
  @override
  _MyAddressesPageState createState() => _MyAddressesPageState();
}

class _MyAddressesPageState extends State<MyAddressesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(myAddresses),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.maxFinite,
        color: Colors.black,
        child: new Container(
          padding: EdgeInsets.all(32),
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("HOME ADDRESS"),
                  InkWell(
                    child: Text("Change"),
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil("NewMyAddressesPage", (route) => true);
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
