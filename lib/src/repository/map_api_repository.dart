import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MapApiRepository {
  final String apiKey = "AIzaSyBs_B61ZJMPu6RpBm388GhkWkZj8jayZfM";
  final dio = Dio();

  getHeatMap() async {
    Response response;
    response = await dio.get(
        'https://airquality.googleapis.com/v1/mapTypes/US_AQI/heatmapTiles/2/0/1?key=$apiKey');
    debugPrint(response.data.toString());
  }
}
