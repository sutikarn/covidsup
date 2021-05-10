import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/intro/intro_page.dart';
import 'package:flutter_app/login/login_page.dart';
import 'package:flutter_app/main/categories/categories_page.dart';
import 'package:flutter_app/main/home_page.dart';
import 'package:flutter_app/main/orders/orderplace_page.dart';
import 'package:flutter_app/main/storemain_page.dart';
import 'package:flutter_app/password/checkyouremail_page.dart';
import 'package:flutter_app/password/resetpassword_page.dart';
import 'package:flutter_app/register/register_page.dart';
import 'package:flutter_app/setting/menusetting/latest_articles_page.dart';
import 'package:flutter_app/setting/menusetting/myaddresses_page.dart';
import 'package:flutter_app/setting/menusetting/mycards_page.dart';
import 'package:flutter_app/setting/menusetting/nearby_stores_page.dart';
import 'package:flutter_app/setting/menusetting/settings_menu_page.dart';
import 'package:flutter_app/setting/menusetting/vouchers_page.dart';
import 'package:flutter_app/splash/splash_page.dart';
import 'package:flutter_app/widget/loading_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'main/orders/orderstatus_page.dart';
import 'setting/menusetting/newmyaddresses_page.dart';
import 'setting/menusetting/order_history_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Uncomment this to use the auth emulator for testing
  // await FirebaseAuth.instance.useEmulator('http://localhost:9099');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () =>
      MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        initialRoute: 'intro',
        routes: {
          "Splash":(context) => SplashPage(),
          "HomePage":(context) => HomePage(),
          "Order History":(context) => OrderHistoryPage(),
          "My Addresses":(context) => MyAddressesPage(),
          "My Cards":(context) => MyCardsPage(),
          "Vouchers":(context) => VouchersPage(),
          "Nearby Stores":(context) => NearbyStoresPage(),
          "Latest Articles":(context) => LatestArticlesPage(),
          "Settings":(context) => SettingsMenuPage(),
          "Login":(context)=> LoginPage(),
          "NewMyAddressesPage":(context) => NewMyAddressesPage(),
          "Reset Password":(context) => ResetPasswordPage(),
          "CheckYourEmail":(context) => CheckYourEmailPage(),
          "LoadingPage":(context) => LoadingPage(),
          "OrderStatusPage":(context) => OrderStatusPage(),
          "OrderPlacePage":(context) => OrderPlacePage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashPage(),
      );
  }
}
