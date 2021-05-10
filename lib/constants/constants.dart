import 'package:flutter/material.dart';
import 'package:flutter_app/model/order_history_model.dart';
import 'package:flutter_app/model/product_model.dart';

var colorYellowGold="#CC9D76";
const brownGoldColor = Color(0xffCC9D76);
List<ProductModel> productItem = [
  ProductModel(
      nameProduct: "Thank God Bowl",
      priceProduct: "€1750",
      imageProduct: "assets/images/Thank_gold_bowl.png",
      topdeal: false,
      widthProduct: "50cm",
      heightProduct: "60cm"),
  ProductModel(
      nameProduct: "Kavuk Vase",
      priceProduct: "€4250",
      imageProduct: "assets/images/Kavuk_Vase.png",
      topdeal: false,
      widthProduct: "150cm",
      heightProduct: "60cm"),
  ProductModel(
      nameProduct: "Rumili Kase",
      priceProduct: "€2350",
      imageProduct: "assets/images/Rumili_Kase.png",
      topdeal: true,
      widthProduct: "50cm",
      heightProduct: "160cm"),
  ProductModel(
      nameProduct: "Gulcehre_ibrik",
      priceProduct: "€5650",
      imageProduct: "assets/images/Gulcehre_ibrik.png",
      topdeal: true,
      widthProduct: "32cm",
      heightProduct: "26cm"),
  ProductModel(
      nameProduct: "Thank God Bowl",
      priceProduct: "€1750",
      imageProduct: "assets/images/Thank_gold_bowl.png",
      topdeal: false,
      widthProduct: "50cm",
      heightProduct: "60cm"),
  ProductModel(
      nameProduct: "Kavuk Vase",
      priceProduct: "€4250",
      imageProduct: "assets/images/Kavuk_Vase.png",
      topdeal: false,
      widthProduct: "150cm",
      heightProduct: "60cm"),
  ProductModel(
      nameProduct: "Rumili Kase",
      priceProduct: "€2350",
      imageProduct: "assets/images/Rumili_Kase.png",
      topdeal: true,
      widthProduct: "50cm",
      heightProduct: "160cm"),
  ProductModel(
      nameProduct: "Gulcehre_ibrik",
      priceProduct: "€5650",
      imageProduct: "assets/images/Gulcehre_ibrik.png",
      topdeal: true,
      widthProduct: "32cm",
      heightProduct: "26cm"),
];

List<OrderHistoryModel> orderHistoryModel =[
  OrderHistoryModel(
    order: "#21412",
    placedOn: "23th of January",
    amount: "\$230.99",
    status: "Delivered",
  ),
  OrderHistoryModel(
    order: "#21415",
    placedOn: "15th of January",
    amount: "\$123.99",
    status: "Canceled",
  ),
  OrderHistoryModel(
    order: "#21417",
    placedOn: "12th of January",
    amount: "\$456.99",
    status: "Delivered",
  ),
];
var homePage ="HomePage";
var orderHistory = "Order History";
var myAddresses ="My Addresses";
var myCards="My Cards";
var vouchers="Vouchers";
var nearbyStores="Nearby Stores";
var latestArticles="Latest Articles";
var settings="Settings";
var resetPassword="Reset Password";
var checkYourEmail ="CheckYourEmail";
var categories ="Categories";

