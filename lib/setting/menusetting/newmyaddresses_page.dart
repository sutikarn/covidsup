import 'package:flutter/material.dart';
import 'package:flutter_app/constants/constants.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';

class NewMyAddressesPage extends StatefulWidget {
  @override
  _NewMyAddressesPageState createState() => _NewMyAddressesPageState();
}

class _NewMyAddressesPageState extends State<NewMyAddressesPage> {
  final _formkey = GlobalKey<FormState>();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final zipCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("New address"),
      ),
      body: Container(
        width: double.maxFinite,
        color: Colors.black,
        child: new Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(32),
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: address1Controller,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'กรุณากรอกข้อมูล'),
                    ]),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Address Line 1",
                      hintText: "Address Line 1",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: address2Controller,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'กรุณากรอกข้อมูล'),
                    ]),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Address Line 2",
                      hintText: "Address Line 2",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: countryController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'กรุณากรอกข้อมูล'),
                    ]),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Country",
                      hintText: "Country",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: cityController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'กรุณากรอกข้อมูล'),
                    ]),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "City",
                      hintText: "City",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: zipCodeController,
                    keyboardType: TextInputType.number,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'กรุณากรอกข้อมูล'),
                    ]),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Zip Code",
                      hintText: "Zip Code",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Set Default Address"),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(26),
                    child: Container(
                      height: 50,
                      width: double.maxFinite,
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: HexColor(colorYellowGold),
                        child: Text("Save Address"),
                        onPressed: () {},
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
}
