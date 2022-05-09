import 'package:clock_weather/pages/home_page.dart';
import 'package:clock_weather/services/di_service.dart';
import 'package:clock_weather/services/theme_mode.dart';
import 'package:clock_weather/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wakelock/wakelock.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DIService.init();
  Wakelock.enable();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: HomePage(),
    );
  }
}