import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/common_widgets/textfields/app_custom_text_field.dart';
import 'package:weather/config/responsive/size_config.dart';
import 'package:weather/constants/app_color.dart';
import 'package:weather/constants/app_text_style.dart';
import 'package:weather/feature/home/controller/home_controller.dart';
import 'package:weather/feature/home/widgets/weather_detail_widget.dart';
import 'package:weather/gen/assets.gen.dart';
import 'package:weather/helpers/debouncer.dart';
import 'package:weather/helpers/helper_method.dart';

@RoutePage()
class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  ConsumerState<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  ///this variable is for text controller
  final TextEditingController _searchController = TextEditingController();

  ///initialising deBouncer for search field
  final DeBouncer _deBouncer = DeBouncer(seconds: 2);

  @override
  void initState() {
    ///calling weather API
    getWeatherData();
    super.initState();
  }

  String weatherImage({required String getWeatherImageString}) {
    WeatherType weatherType = getWeatherTypeFromString(getWeatherImageString);
    String weatherImagePath = getWeatherImage(weatherType);
    return weatherImagePath;
  }

  @override
  Widget build(BuildContext context) {
    ///listening to API data
    final weatherData = ref.watch(homeControllerProvider).weatherData;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 20 * SizeConfig.widthMultiplier,
              vertical: 16 * SizeConfig.heightMultiplier),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                AppColors.kBlue41,
                AppColors.kBlue51,
                AppColors.kBlue51
              ])),
          child: SafeArea(
            child: Column(children: [
              ///search field controller UI
              _searchTextField(),
              if (weatherData != null) ...[
                SizedBox(
                  height: 70 * SizeConfig.heightMultiplier,
                ),

                ///Weather Icon of current weather
                _weatherIcon(
                    weatherType: weatherImage(
                        getWeatherImageString:
                            (weatherData.current?.weatherDescriptions ?? [])
                                .first
                                .toLowerCase())),
                SizedBox(
                  height: 30 * SizeConfig.heightMultiplier,
                ),

                ///Current temperature of location
                _currentTemp(temperature: weatherData.current?.temperature),
                SizedBox(
                  height: 20 * SizeConfig.heightMultiplier,
                ),

                ///Weather description UI
                _weatherDesc(
                    weatherDesc:
                        (weatherData.current?.weatherDescriptions ?? []).first),
                SizedBox(
                  height: 10 * SizeConfig.heightMultiplier,
                ),

                ///City name UI
                _cityName(cityName: weatherData.location?.name?.trim()),
                const Spacer(),

                ///Weather other data UI and wind speed UI
                weatherDetailedCardWidget(
                    humidity: weatherData.current?.humidity,
                    temperature: weatherData.current?.temperature,
                    windSpeed: weatherData.current?.windSpeed),
                SizedBox(
                  height: 20 * SizeConfig.heightMultiplier,
                ),
              ] else ...[
                SizedBox(
                  height: 300 * SizeConfig.heightMultiplier,
                ),
                const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.kPureWhite,
                ))
              ]
            ]),
          ),
        ),
      ),
    );
  }

  Text _weatherDesc({String? weatherDesc}) {
    return Text(
      weatherDesc ?? '',
      style: TStyles.r16.white,
    );
  }

  Text _cityName({String? cityName}) {
    return Text(
      cityName ?? '',
      style: TStyles.r18.white,
    );
  }

  Text _currentTemp({int? temperature}) {
    return Text(
      "${temperature ?? ""}º",
      style: TStyles.r60.white,
    );
  }

  Image _weatherIcon({required String weatherType}) {
    return Image.asset(
      weatherType,
      height: 150 * SizeConfig.heightMultiplier,
      width: 400 * SizeConfig.widthMultiplier,
    );
  }

  Align _searchTextField() {
    return Align(
      alignment: Alignment.topCenter,
      child: TextFieldContainer(
        suffixWidget: const Icon(
          Icons.search,
          color: AppColors.kPureWhite,
        ),
        hint: "Search city name",
        onChanged: (v) {
          ///adding deBouncer to limit API calls and unnecessary API calls
          _deBouncer.run(() {
            if (_searchController.text.isNotEmpty == true &&
                _searchController.text.length > 3) {
              ///Calling weather API with searched city name
              getWeatherData(city: _searchController.text);
            } else {
              ///Calling weather API with initial city
              getWeatherData();
            }
          });
        },
        textEditingController: _searchController,
        textInputType: TextInputType.name,
        onSaved: (String? v) {},
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getWeatherData({String? city}) {
    _deBouncer.dispose();

    ///calling weather api to get initial weather data
    ref.read(homeControllerProvider).getWeather(context: context, city: city);
  }

  String getWeatherImage(WeatherType weatherType) {
    switch (weatherType) {
      case WeatherType.sunny:
        return Assets.weatherIcons.sunCloudIcon.path;
      case WeatherType.clear:
        return Assets.weatherIcons.clear.path;
      case WeatherType.overcast:
        return Assets.weatherIcons.overcast.path;
      case WeatherType.smoke:
        return Assets.weatherIcons.smoke.path;
      case WeatherType.rain:
        return Assets.weatherIcons.rainIcon.path;
      default:
        return Assets.weatherIcons.sunIcon.path;
    }
  }
}
