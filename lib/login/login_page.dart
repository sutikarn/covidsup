import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/constants.dart';
import 'package:flutter_app/main/home_page.dart';
import 'package:flutter_app/register/register_page.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  User _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool isSignIn = false;
  bool google = false;
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('LOGIN'),
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
                    'Let’s sign you in',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Welcome back, you’ve been missed!',
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
                            labelText: "Username Or Email",
                            hintText: "Username Or Email",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Checkbox(
                                    activeColor: Colors.amber,
                                    onChanged: (bool newValue) {
                                      remember = newValue;
                                      setState(() {});
                                    },
                                    value: remember,
                                    focusColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Remember me",
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: HexColor("#CC9D76"),
                                highlightColor: HexColor("#CC9D76"),
                                onTap: () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(resetPassword, (route) => true);
                                },
                                child: Text(
                                  "Forgot password?",
                                  style: TextStyle(),
                                ),
                              ),
                            )
                          ],
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
                    onPressed: () async {
                      signInWithGoogle().then((User user) {
                        Navigator.of(context).pushNamedAndRemoveUntil(homePage, (route) => false);
                      }).catchError((e) => print(e));
                    },
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
                    onPressed: (){
                      loginWithFacebook(context).then((User user) {
                        Navigator.of(context).pushNamedAndRemoveUntil(homePage, (route) => false);
                      }).catchError((e) => print(e));
                    },
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      'Already have an account? Sign In',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  Future<User> signInWithGoogle() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();


    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    UserCredential authResult = await _auth.signInWithCredential(credential);

    _user = authResult.user;

    assert(!_user.isAnonymous);

    assert(await _user.getIdToken() != null);

   User currentUser =  _auth.currentUser;

    assert(_user.uid == currentUser.uid);

    print("User Name: ${_user.displayName}");
    print("User Email ${_user.email}");

    return _user;
  }

  Future<User> loginWithFacebook(BuildContext context) async {
    FacebookLogin facebookLogin = FacebookLogin();
    FacebookLoginResult result = await facebookLogin.logIn(['email', 'public_profile']);

    String token = result.accessToken.token;
    print("Access token = $token");
    UserCredential authResult = await _auth.signInWithCredential(FacebookAuthProvider.credential(token));
    _user = authResult.user;

    assert(!_user.isAnonymous);

    assert(await _user.getIdToken() != null);

    User currentUser =  _auth.currentUser;

    assert(_user.uid == currentUser.uid);

    print("User Name: ${_user.displayName}");
    print("User Email ${_user.email}");

    return _user;
  }
}
