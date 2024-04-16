
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:open_weather_flutter_app/responses/country_details_model.dart';
import 'package:open_weather_flutter_app/responses/country_weather_details_model.dart';

class ApiManager {
  static final ApiManager _instance = ApiManager._internal();
  factory ApiManager() => _instance;
  ApiManager._internal();
  final String? _key = dotenv.env["API_KEY"];
  final String? _baseUrl = dotenv.env["BASE_URL"];

  static final Dio _dio = Dio();
  Future<CountryWeatherDetails?> getWeather({double? lat, double? lon}) async {
    return await _dio
        .get(
            "$_baseUrl/data/2.5/forecast?lat=$lat&lon=$lon&appid=$_key&cnt=40&units=metric")
        .then((value) {
      if (value.statusCode == 200) {
        return CountryWeatherDetails.fromJson(value.data);
      }
      return null;
    }).catchError((e) {
      return null;
    });
  }

  Future<CountryDetailsModel?> getLocationCoordinates(
      {String? cityName}) async {
    CountryDetailsModel? countryDetails;
    return await _dio
        .get("$_baseUrl/geo/1.0/direct?q=$cityName&appid=$_key")
        .then((value) {
      if (value.statusCode == 200) {
        countryDetails = CountryDetailsModel.fromJson(value.data.first);
      }
      return countryDetails;
    }).catchError((e) {
      return null;
    });
  }
}
