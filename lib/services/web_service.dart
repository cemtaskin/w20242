import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wheater_app/models/wheater_app_response.dart';
import 'package:wheater_app/services/location_service.dart';

//https://api.openweathermap.org/data/2.5/weather?lat=41.067&lon=28.999&appid=d15cc87781439546b43c86182019a96a
class WebService {
  Future<WheaterAppResponse> getWheater(LocationService locationService) async {
    var r = WheaterAppResponse();
    final queryParameters = {
      'lat': '41.067',
      'lon': '28.999',
      'appid': 'd15cc87781439546b43c86182019a96a',
    };

    var url = Uri.https(
        'api.openweathermap.org', 'data/2.5/weather', queryParameters);

    var response = await http.get(url);

    try {
      r = WheaterAppResponse.fromJson(jsonDecode(response.body));
    } catch (e) {}

    return r;
  }
}
