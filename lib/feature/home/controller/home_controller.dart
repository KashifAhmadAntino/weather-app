import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/feature/home/models/weather_data_model.dart';
import 'package:weather/feature/home/repository/home_repository.dart';
import 'package:weather/helpers/api_exception_handler.dart';

ChangeNotifierProvider<HomeController> homeControllerProvider =
    ChangeNotifierProvider<HomeController>((ref) => HomeController());

class HomeController extends ChangeNotifier {
  ///This variable will hold api response
  WeatherDataModel? weatherData;
  bool? isWeatherApiLoading;

  Future<void> getWeather({String? city, required BuildContext context}) async {
    isWeatherApiLoading = true;
    try {
      final weatherResponse =
          await HomeRepository.getWeather(city: city ?? 'new delhi');
      weatherData = WeatherDataModel.fromJson(weatherResponse ?? {});
      notifyListeners();
    } catch (exception) {
      ///handling error exception in API

      ///this method will get the error message fromAPI error
      final errorMessage = ApiExceptionHandler.error(exception);

      ///Toast to show user if api has any exception
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    }
    isWeatherApiLoading = false;
  }
}
