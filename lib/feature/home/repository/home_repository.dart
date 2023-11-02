import 'package:weather/config/api_service/dio_utils_service.dart';
import 'package:weather/constants/api_route.dart';

class HomeRepository {
  static final dio = DioUtil().getInstance();

  static Future<Map<String, dynamic>?> getWeather(
      {required String city}) async {
    final queryParam = {
      ///this is the weather dummy API key for now its here else it will be under ENV file
      'access_key': 'c9950786876f68d15974e28e6b4095c8',
      'query': city
    };
    final weatherResponse =
        await dio?.get(ApiRoute.getWeather, queryParameters: queryParam);
    return weatherResponse?.data;
  }
}
