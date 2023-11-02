import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather/constants/app_text_style.dart';
import 'package:weather/gen/assets.gen.dart';
import 'package:weather/helpers/route_helper/any_where_door.dart';
import 'package:weather/helpers/route_helper/route_helper.gr.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        AnywhereDoor.push(context, path: const LoginRoute());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.splash.splash.path),
                fit: BoxFit.fill)),
        child: Center(
            child: Text(
          "Weather App",
          style: TStyles.b24,
        )),
      ),
    );
  }
}
