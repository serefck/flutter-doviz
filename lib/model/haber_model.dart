// To parse this JSON data, do
//
//     final haberModel = haberModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HaberModel haberModelFromMap(String str) =>
    HaberModel.fromMap(json.decode(str));

String haberModelToMap(HaberModel data) => json.encode(data.toMap());

class HaberModel {
  HaberModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.source,
    required this.date,
    required this.url,
  });

  final String id;
  final String name;
  final String description;
  final String image;
  final String source;
  final dynamic date;
  final String url;

  factory HaberModel.fromMap(Map<String, dynamic> json) => HaberModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        image: json["image"] == null ? null : json["image"],
        source: json["source"] == null ? null : json["source"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "image": image == null ? null : image,
        "source": source == null ? null : source,
        "date": date == null
            ? null
            : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "url": url == null ? null : url,
      };
}
