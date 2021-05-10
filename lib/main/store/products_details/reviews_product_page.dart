import 'package:flutter/material.dart';
import 'package:flutter_app/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';

class ReviewsProductPage extends StatefulWidget {
  @override
  _ReviewsProductPageState createState() => _ReviewsProductPageState();
}

class _ReviewsProductPageState extends State<ReviewsProductPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(8),
        child:Column(
          children: [
            review(),
            review(),
          ],
        )
      ),
    );
  }

  Column review(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0xffF7F7F7),
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/Kavuk_Vase.png'),
                ),
              ),
            ),
            Column(
              children: [
                Text('VIctor Flexin'),
                Text('Review Star')
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                "27 November 2019",
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        SizedBox(height: 30,),
        Text('The dial on this timepiece is extremely unique, as it is a concentric circular pattern that is covered by sturdy sapphire glass.'),
        SizedBox(
          height: 19,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlatButton(
              minWidth: 110,
              height: 36,
              color: Colors.grey[200].withOpacity(0.7),
              child: Text(
                "Helpful?",
                style: TextStyle(),
              ),
              onPressed: () {},
            ),
            GestureDetector(
              onTap: () {
                print("click");
              },
              child: Text(
                "Report",
                style: TextStyle(color: HexColor("#CC9D76")),
              ),
            ),
          ],
        ),
        Divider(
          height: 60,
          thickness: 1,
        ),
      ],
    );
  }
}
