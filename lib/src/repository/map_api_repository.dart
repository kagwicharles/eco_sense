import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MapApiRepository {
  final String apiKey = dotenv.env['MAP_API_KEY']!;
  final dio = Dio();

  getHeatMap() async {
    Response response;
    response = await dio.get(
        'https://airquality.googleapis.com/v1/mapTypes/US_AQI/heatmapTiles/2/0/1?key=$apiKey');
    debugPrint(response.data.toString());
  }
}
