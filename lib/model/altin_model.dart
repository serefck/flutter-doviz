// To parse this JSON data, do
//
//     final altinModel = altinModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AltinModel altinModelFromMap(String str) =>
    AltinModel.fromMap(json.decode(str));

String altinModelToMap(AltinModel data) => json.encode(data.toMap());

class AltinModel {
  AltinModel({
    required this.id,
    required this.name,
    required this.buyingstr,
    required this.sellingstr,
    required this.rate,
  });

  final String id;
  final String name;
  final String buyingstr;
  final String sellingstr;
  final String rate;

  factory AltinModel.fromMap(Map<String, dynamic> json) => AltinModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        buyingstr: json["buyingstr"] == null ? null : json["buyingstr"],
        sellingstr: json["sellingstr"] == null ? null : json["sellingstr"],
        rate: json["rate"] == null ? null : json["rate"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "buyingstr": buyingstr == null ? null : buyingstr,
        "sellingstr": sellingstr == null ? null : sellingstr,
        "rate": rate == null ? null : rate,
      };
}
