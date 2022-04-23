import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency/model/haber_model.dart';

class HaberApi {
  static String _url = 'https://kredibireysel.com/veri/haber.json';

  static Future<List<HaberModel>> getHaberData() async {
    var response = await Dio().get('https://kredibireysel.com/veri/haber.json');
    List<HaberModel> haberList =
        (response.data as List).map((e) => HaberModel.fromMap(e)).toList();

    var haberListe =
        (response.data as List).map((e) => HaberModel.fromMap(e)).toList();

    return haberList;
  }
}
