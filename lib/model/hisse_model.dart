// To parse this JSON data, do
//
//     final hisseModel = hisseModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HisseModel hisseModelFromMap(String str) =>
    HisseModel.fromMap(json.decode(str));

String hisseModelToMap(HisseModel data) => json.encode(data.toMap());

class HisseModel {
  HisseModel({
    required this.id,
    required this.text,
    required this.lastpricestr,
    required this.rate,
  });

  final String id;
  final String text;
  final String lastpricestr;
  final String rate;

  factory HisseModel.fromMap(Map<String, dynamic> json) => HisseModel(
        id: json["id"] == null ? null : json["id"],
        text: json["text"] == null ? null : json["text"],
        lastpricestr:
            json["lastpricestr"] == null ? null : json["lastpricestr"],
        rate: json["rate"] == null ? null : json["rate"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "text": text == null ? null : text,
        "lastpricestr": lastpricestr == null ? null : lastpricestr,
        "rate": rate == null ? null : rate,
      };
}
