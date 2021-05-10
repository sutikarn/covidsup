import 'package:flutter/material.dart';
import 'package:flutter_app/constants/constants.dart';
class LatestArticlesPage extends StatefulWidget {
  @override
  _LatestArticlesPageState createState() => _LatestArticlesPageState();
}

class _LatestArticlesPageState extends State<LatestArticlesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(latestArticles),
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
        ),
      ),
    );
  }
}
