import 'dart:io';

import 'package:clock_weather/models/Weather.dart';
import 'package:clock_weather/services/http_service.dart';
import 'package:clock_weather/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';

class HomeController extends GetxController{
    var temp = 0.obs;
    var weatherCode = ''.obs;
    var isLoading = false.obs;
    var region = 'tashkent'.obs;
    var activeConnection = false.obs;
    var str = "".obs;

    var timeString = ''.obs;
    var monthDay = ''.obs;
    var week = ''.obs;
    var now = DateTime.now().obs;
    var height = 0.0.obs;
    var width = 0.0.obs;
    var isSwitched = false.obs;


    Future<void> getWeather({required region}) async{
        isLoading.value = true;

        Network.GET(Network.API_GET, Network.paramsGet(region: region)).then((value) {
            if(value != null) {
                temp.value =  weatherFromJson(value).airT!.toInt();
                weatherCode.value = weatherFromJson(value).weatherCode!;
            }
            isLoading.value = false;
        });
    }

    Future<void> checkUserConnection() async {
        try {
            final result = await InternetAddress.lookup('google.com');
            if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                activeConnection.value = true;
                str.value = "back to online";
            }
        } on SocketException catch (_) {
            activeConnection.value = false;
            str.value = "No internet connection";
        }
    }

    void getTime({required connection}) {
        if(connection) {
            NTP.now().then((value) {
                now.value = value;
            });
        }else {
            now.value = DateTime.now();
        }
        timeString.value = DateFormat('hh:mm').format(now.value);
        monthDay.value = DateFormat('dd MMMM').format(now.value);
        week.value = DateFormat('EEEE').format(now.value);
    }


    PopupMenuItem popup ({required value, required location}) {
        return PopupMenuItem(
            onTap: () {
                if(value != location){
                    region.value = location;
                    getWeather(region: value);
                }
            },
            child: Text(location),
        );
    }
}