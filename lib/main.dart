import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:salon_secret/View/login/login_screen.dart';

import 'Config/Utils/app_state_notifyer.dart';
import 'Config/Utils/color.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    AppColors.isdarktheme=isDarkMode;

    return GetMaterialApp(
      title: "Salon Secret",
      defaultGlobalState: true,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      // routes: routes,
      theme: ThemeData(
          primaryColor: AppColors.PRIMARY_COLOR,
          backgroundColor: AppColors.BACKGROUND_COLOR,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Poppins"
      ),
      darkTheme: ThemeData(
          primaryColor: AppColors.PRIMARY_COLOR,
          backgroundColor: AppColors.BACKGROUND_COLOR,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Poppins"
      ),
      transitionDuration: Duration.zero,
      popGesture: false,

      home: LoginScreen(),

      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.0);
        return MediaQuery(
          child: child!,
          data: mediaQueryData.copyWith(textScaleFactor: scale,),
        );
      },
    );
  }
}
