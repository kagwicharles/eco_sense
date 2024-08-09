import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MapApiRepository {
  final String apiKey = dotenv.env['MAP_API_KEY']!;
  final dio = Dio();

  Future<Response?> getHeatMap() async {
    Response response;
    response = await dio.get(
        'https://airquality.googleapis.com/v1/mapTypes/UAQI_RED_GREEN/heatmapTiles/2/0/1?key=$apiKey',
        options: Options(responseType: ResponseType.bytes));

    debugPrint("heatmap****************************${response.data}");
    return response;
  }
}
