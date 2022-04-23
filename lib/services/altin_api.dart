import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency/model/altin_model.dart';

class AltinApi {
  static String _url = 'https://kredibireysel.com/veri/altin.json';

  static Future<List<AltinModel>> getAltinData() async {
    var response = await Dio().get('https://kredibireysel.com/veri/altin.json');
    List<AltinModel> altinList =
        (response.data as List).map((e) => AltinModel.fromMap(e)).toList();

    var altinListe =
        (response.data as List).map((e) => AltinModel.fromMap(e)).toList();

    return altinList;
  }
}
