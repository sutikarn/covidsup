import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart.';
import 'package:flutter_app/constants/constants.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RESET PASSWORD'),
        backgroundColor: Colors.black,
        actions: [],
      ),
      body: Container(
        height: double.maxFinite,
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
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Forgot your password?',
                style: TextStyle(fontSize: 26),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Enter your email address and we will send you \n instructions on how to reset your password.',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.number,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'กรุณากรอกข้อมูล'),
                ]),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email address",
                  hintText: "Email address",
                ),
              ),
              Expanded(child: SizedBox()),
              Container(
                height: 50,
                width: double.maxFinite,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: HexColor("#CC9D76"),
                  child: Text("RECOVER EMAIL"),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(checkYourEmail, (route) => false);
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
