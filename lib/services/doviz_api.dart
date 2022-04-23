import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency/model/doviz_model.dart';

class DovizApi {
  static String _url = 'https://kredibireysel.com/veri/doviz.json';

  static Future<List<DovizModel>> getDovizData() async {
    var response = await Dio().get('https://kredibireysel.com/veri/doviz.json');
    List<DovizModel> dovizList =
        (response.data as List).map((e) => DovizModel.fromMap(e)).toList();

    var dovizListe =
        (response.data as List).map((e) => DovizModel.fromMap(e)).toList();

    return dovizList;
  }
}
