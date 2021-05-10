// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.nameProduct,
    this.priceProduct,
    this.imageProduct,
    this.widthProduct,
    this.heightProduct,
    this.topdeal,
  });

  String nameProduct;
  String priceProduct;
  String imageProduct;
  String widthProduct;
  String heightProduct;
  bool topdeal;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    nameProduct: json["nameProduct"] == null ? null : json["nameProduct"],
    priceProduct: json["priceProduct"] == null ? null : json["priceProduct"],
    imageProduct: json["imageProduct"] == null ? null : json["imageProduct"],
    widthProduct: json["widthProduct"] == null ? null : json["widthProduct"],
    heightProduct: json["heightProduct"] == null ? null : json["heightProduct"],
    topdeal: json["topdeal"] == null ? null : json["topdeal"],
  );

  Map<String, dynamic> toJson() => {
    "nameProduct": nameProduct == null ? null : nameProduct,
    "priceProduct": priceProduct == null ? null : priceProduct,
    "imageProduct": imageProduct == null ? null : imageProduct,
    "widthProduct": widthProduct == null ? null : widthProduct,
    "heightProduct": heightProduct == null ? null : heightProduct,
    "topdeal": topdeal == null ? null : topdeal,
  };
}
