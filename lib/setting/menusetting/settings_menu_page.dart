import 'package:flutter/material.dart';
import 'package:flutter_app/constants/constants.dart';

class SettingsMenuPage extends StatefulWidget {
  @override
  _SettingsMenuPageState createState() => _SettingsMenuPageState();
}

class _SettingsMenuPageState extends State<SettingsMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(settings),
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
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 41,
                    ),
                    title("LANGUAGE", "Change"),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "English",
                    ),
                    Divider(
                      thickness: 1,
                      height: 62,
                    ),
                    title("PASSWORD", "Change"),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "• • • • • • • • • • • • • • • • • • • •",
                    ),
                    Divider(
                      thickness: 1,
                      height: 62,
                    ),
                    title("LOCATION", "EDIT"),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Istanbul, TR",
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Divider(
                      thickness: 1,
                      height: 52,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
  Row title(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
        ),
        Text(
          action,
        ),
      ],
    );
  }
}
