import 'package:flutter/material.dart';
class Buttondefault extends StatelessWidget{

  final String message;
  final Function fuction;
  final Color color;
  const Buttondefault({
    Key key,
   this.message,
   this.fuction,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return Container(
     padding: EdgeInsets.all(16),
     child: FlatButton(
       minWidth: double.maxFinite,
       padding: EdgeInsets.all(16),
       onPressed: fuction,
       color: color,
       textColor: Colors.white,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(22.0),
       ),
       child: Text(
         message,
         style: TextStyle(
           letterSpacing: 2,
           fontSize: 15,
         ),
       ),
     ),
   );
  }

}