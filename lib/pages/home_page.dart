import 'dart:async';

import 'package:clock_weather/controllers/home_controller.dart';
import 'package:clock_weather/services/theme_mode.dart';
import 'package:clock_weather/services/theme_service.dart';
import 'package:clock_weather/views/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = Get.find<HomeController>();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.isDarkMode ? controller.isSwitched.value = false : controller.isSwitched.value = true;
    controller.checkUserConnection().then((value){
      if(controller.activeConnection.value) controller.getWeather(region: controller.region.value);
    });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      controller.checkUserConnection().then((value){
        controller.getTime(connection: controller.activeConnection.value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    controller.height.value = MediaQuery.of(context).size.height;
    controller.width.value = MediaQuery.of(context).size.width;
    final window = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    return GetX<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text('Clock and Weather'),
          centerTitle: true,
          actions: [
            Switch(
              onChanged: (bool value) {
                if(value) {
                  Get.changeThemeMode(ThemeMode.dark);
                  ThemeService().switchTheme();
                  controller.isSwitched.value = value;
                }else{
                  Get.changeThemeMode(ThemeMode.light);
                  ThemeService().switchTheme();
                  controller.isSwitched.value = value;
                }
              },
              value: controller.isSwitched.value,
              inactiveThumbColor: Colors.blue,
              inactiveTrackColor: Colors.indigoAccent,
              activeTrackColor: Colors.white,
              activeColor: Colors.deepPurpleAccent,
            ),
            controller.activeConnection.value ?
            PopupMenuButton(
                icon: const Icon(Icons.menu),
                itemBuilder: (context) => [
                  controller.popup(value: controller.region.value, location: 'tashkent'),
                  controller.popup(value: controller.region.value, location: 'andijan'),
                  controller.popup(value: controller.region.value, location: 'bukhara'),
                  controller.popup(value: controller.region.value, location: 'gulistan'),
                  controller.popup(value: controller.region.value, location: 'jizzakh'),
                  controller.popup(value: controller.region.value, location: 'qarshi'),
                  controller.popup(value: controller.region.value, location: 'navoiy'),
                  controller.popup(value: controller.region.value, location: 'namangan'),
                  controller.popup(value: controller.region.value, location: 'nukus'),
                  controller.popup(value: controller.region.value, location: 'samarkand'),
                  controller.popup(value: controller.region.value, location: 'termez'),
                  controller.popup(value: controller.region.value, location: 'urgench'),
                  controller.popup(value: controller.region.value, location: 'fergana'),

                ]
            ) : const SizedBox.shrink(),
          ],
        ),
        body: SizedBox(
          height: controller.height.value,
          width: controller.width.value,
          child: !controller.isLoading() ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Get.isDarkMode ? const AssetImage('assets/images/background.png') : const AssetImage('assets/images/background_light.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: controller.height.value * 0.1),
                        height: controller.height.value * 0.5,
                        width: controller.width.value * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 2, color: Colors.indigoAccent),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset('assets/images/gerb.png', height: controller.height.value * 0.22, fit: BoxFit.cover,),
                    ),

                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: controller.height.value * 0.2),
                      child: window.size.shortestSide < 600 ?
                      View.setTimeMobile(window: window, controller: controller, context: context) :
                      View.setTimeTablet(controller: controller, window: window, context: context),
                    ),
                  ],
                ),

                SizedBox(height: controller.height.value * 0.03,),

                controller.activeConnection.value ?
                Flexible(
                  child: window.size.shortestSide < 600 ?
                  View.setWeatherMobile(controller: controller, window: window, context: context) :
                  View.setWeatherTablet(controller: controller, window: window, context: context),
                )
                : const SizedBox.shrink(),
              ],
            ),
          ) : const Center(child: CircularProgressIndicator(),),
        ),
      ),
    );
  }
}
