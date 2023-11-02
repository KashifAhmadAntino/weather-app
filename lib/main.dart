import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/config/responsive/size_config.dart';
import 'package:weather/firebase_options.dart';
import 'package:weather/helpers/route_helper/route_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// create an instance of `AppRouter`
  final _appRouter = RouteHelper();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _appRouter = RouteHelper();
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (context, snapshot) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return OrientationBuilder(
              builder: (context, orientation) {
                SizeConfig().init(constraints, orientation);
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'Weather App',
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  routerConfig: _appRouter.config(),
                );
              },
            );
          },
        );
      },
    );
  }
}
