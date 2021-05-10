import 'package:flutter/material.dart';

class SpecificationsPage extends StatefulWidget {
  @override
  _SpecificationsPageState createState() => _SpecificationsPageState();
}

class _SpecificationsPageState extends State<SpecificationsPage> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery
        .of(context)
        .size
        .width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.08),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          item("Case diameter", "Diameter: 20 cm Length: 40 cm"),
          Divider(
            height: 40,
            thickness: 1,
          ),
          item("Product Origin", "Turkey"),
          Divider(
            height: 40,
            thickness: 1,
          ),
          item("Production method", "100% handmade."),
          Divider(
            height: 40,
            thickness: 1,
          ),
          item("Material", "Gold and Glass crafting"),
          Divider(
            height: 40,
            thickness: 1,
          ),
          item("Strap color", "Gold Color"),
          SizedBox(
            height: 21.5,
          ),
        ],
      ),
    );
  }

  Row item(String title, String message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.grey),
        ),
        Text(
          message,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
