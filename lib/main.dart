import 'package:aichat/inftrastructure/constant/theme_constant.dart';
import 'package:aichat/inftrastructure/routes/app_pages.dart';
import 'package:aichat/inftrastructure/routes/route_constants.dart';
import 'package:aichat/ui/main_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/shared/theme_controller.dart';
SharedPreferences ?prefs;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   prefs = await SharedPreferences.getInstance();
  Gemini.init(
      apiKey: const String.fromEnvironment('apiKey'), enableDebugging: true);
  Gemini.reInitialize(apiKey: "AIzaSyDp5bif8OWhlFpNEhUVqdZsofhd2hA8KCo", enableDebugging: false);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: false,
      getPages: AppPages.routes,
      themeMode: themeController.theme,
      initialRoute: RouteConstants.mainScreen,
      darkTheme: ConstantTheme.darkTheme,
      theme: ConstantTheme.lightTheme,
      initialBinding: MainBinding(),
    );
  }
}

