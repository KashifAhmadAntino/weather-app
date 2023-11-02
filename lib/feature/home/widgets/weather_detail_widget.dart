import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather/config/responsive/size_config.dart';
import 'package:weather/constants/app_text_style.dart';
import 'package:weather/gen/assets.gen.dart';

weatherDetailedCardWidget({int? temperature, int? humidity, int? windSpeed}) {
  return Container(
    padding: EdgeInsets.all(8 * SizeConfig.widthMultiplier),
    height: 50 * SizeConfig.heightMultiplier,
    decoration: ShapeDecoration(
      color: const Color(0xFF0F4083).withOpacity(0.20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x3F000000),
          blurRadius: 20,
          offset: Offset(0, 0),
          spreadRadius: 0,
        )
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _chipWidget(
            image: Assets.weatherIcons.rain.path, text: "${humidity ?? ''}%"),
        _chipWidget(
            image: Assets.weatherIcons.humidity.path,
            text: "${temperature ?? ''}%"),
        _chipWidget(
            image: Assets.weatherIcons.wind.path,
            text: "${windSpeed ?? ''}Km/h"),
      ],
    ),
  );
}

Row _chipWidget({required String image, required String text}) {
  return Row(
    children: [
      Image.asset(
        image,
      ),
      Text(
        text,
        style: TStyles.msb14.white,
      )
    ],
  );
}
