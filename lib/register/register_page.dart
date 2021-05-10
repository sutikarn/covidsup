import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Register'),
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
                )),
            child: SingleChildScrollView(
              child: new Column(
                children: [
                  Text(
                    'Create your account',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'After your registration is complete',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'you can see our opportunity products.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: usernameController,
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'กรุณากรอกข้อมูล'),
                            MinLengthValidator(10,
                                errorText: 'username ต้องมี 10 หลัก')
                          ]),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Username",
                            hintText: "Username",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'กรุณากรอกข้อมูล'),
                            EmailValidator(errorText: 'กรอก EMAIL ไม่ถูกต้อง'),
                          ]),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email",
                            hintText: "Email",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'กรุณากรอกข้อมูล'),
                            MinLengthValidator(10,
                                errorText: 'password ต้องมี 10 หลัก'),
                          ]),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password",
                            hintText: "Password",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'กรุณากรอกข้อมูล'),
                            MinLengthValidator(10,
                                errorText: 'เบอโทรไม่ครบ10 หลัก'),
                          ]),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Phone",
                            hintText: "Phone",
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
                            color: HexColor("#CC9D76"),
                            child: Text("SIGN UP"),
                            onPressed: () {},
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FlatButton(
                    height: 50,
                    minWidth: double.maxFinite,
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/icon_google.png"),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Continue with Google',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.red,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    height: 50,
                    minWidth: double.maxFinite,
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/Icons_facebook.png"),
                        SizedBox(
                          width: 15,
                        ),
                        Text('Continue with Facebook',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            )),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.blue,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Already have an account? Sign In',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
