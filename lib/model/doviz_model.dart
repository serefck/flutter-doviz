// To parse this JSON data, do
//
//     final dovizModel = dovizModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DovizModel dovizModelFromMap(String str) => DovizModel.fromMap(json.decode(str));

String dovizModelToMap(DovizModel data) => json.encode(data.toMap());

class DovizModel {
    DovizModel({
        required this.id,
        required this.name,
        required this.code,
        required this.buyingstr,
        required this.sellingstr,
        required this.rate,
    });

    final String id;
    final String name;
    final String code;
    final String buyingstr;
    final String sellingstr;
    final String rate;

    @override
    String toString() {
      return name;
    }

    factory DovizModel.fromMap(Map<String, dynamic> json) => DovizModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        code: json["code"] == null ? null : json["code"],
        buyingstr: json["buyingstr"] == null ? null : json["buyingstr"],
        sellingstr: json["sellingstr"] == null ? null : json["sellingstr"],
        rate: json["rate"] == null ? null : json["rate"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "code": code == null ? null : code,
        "buyingstr": buyingstr == null ? null : buyingstr,
        "sellingstr": sellingstr == null ? null : sellingstr,
        "rate": rate == null ? null : rate,
    };
}
