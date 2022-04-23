import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency/model/hisse_model.dart';

class HisseApi {
  static String _url = 'https://kredibireysel.com/veri/hisse.json';

  static Future<List<HisseModel>> getHisseData() async {
    var response = await Dio().get('https://kredibireysel.com/veri/hisse.json');
    List<HisseModel> hisseList =
        (response.data as List).map((e) => HisseModel.fromMap(e)).toList();

    var hisseListe =
        (response.data as List).map((e) => HisseModel.fromMap(e)).toList();

    return hisseList;
  }
}
