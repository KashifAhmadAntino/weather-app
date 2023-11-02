/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsSplashGen {
  const $AssetsSplashGen();

  /// File path: assets/splash/splash.jpeg
  AssetGenImage get splash => const AssetGenImage('assets/splash/splash.jpeg');

  /// List of all assets
  List<AssetGenImage> get values => [splash];
}

class $AssetsWeatherIconsGen {
  const $AssetsWeatherIconsGen();

  /// File path: assets/weather_icons/clear.png
  AssetGenImage get clear =>
      const AssetGenImage('assets/weather_icons/clear.png');

  /// File path: assets/weather_icons/humidity.png
  AssetGenImage get humidity =>
      const AssetGenImage('assets/weather_icons/humidity.png');

  /// File path: assets/weather_icons/overcast.png
  AssetGenImage get overcast =>
      const AssetGenImage('assets/weather_icons/overcast.png');

  /// File path: assets/weather_icons/rain.png
  AssetGenImage get rain =>
      const AssetGenImage('assets/weather_icons/rain.png');

  /// File path: assets/weather_icons/rain_icon.png
  AssetGenImage get rainIcon =>
      const AssetGenImage('assets/weather_icons/rain_icon.png');

  /// File path: assets/weather_icons/smoke.png
  AssetGenImage get smoke =>
      const AssetGenImage('assets/weather_icons/smoke.png');

  /// File path: assets/weather_icons/sun.png
  AssetGenImage get sun => const AssetGenImage('assets/weather_icons/sun.png');

  /// File path: assets/weather_icons/sun_cloud.png
  AssetGenImage get sunCloud =>
      const AssetGenImage('assets/weather_icons/sun_cloud.png');

  /// File path: assets/weather_icons/sun_cloud_icon.png
  AssetGenImage get sunCloudIcon =>
      const AssetGenImage('assets/weather_icons/sun_cloud_icon.png');

  /// File path: assets/weather_icons/sun_icon.png
  AssetGenImage get sunIcon =>
      const AssetGenImage('assets/weather_icons/sun_icon.png');

  /// File path: assets/weather_icons/wind.png
  AssetGenImage get wind =>
      const AssetGenImage('assets/weather_icons/wind.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        clear,
        humidity,
        overcast,
        rain,
        rainIcon,
        smoke,
        sun,
        sunCloud,
        sunCloudIcon,
        sunIcon,
        wind
      ];
}

class Assets {
  Assets._();

  static const $AssetsSplashGen splash = $AssetsSplashGen();
  static const $AssetsWeatherIconsGen weatherIcons = $AssetsWeatherIconsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
