import 'package:clock_weather/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class View {

  static Widget setTimeMobile({required window, required HomeController controller, required context}) {
    return Column(
      children: [
        Text(controller.timeString.value,
          style: TextStyle(fontSize: window.size.shortestSide * 0.2, color: Theme.of(context).dividerColor),),
        Text(controller.monthDay.value,
          style: TextStyle(fontSize: window.size.shortestSide * 0.1),),
        Text(controller.week.value,
          style: TextStyle(fontSize: window.size.shortestSide * 0.09),),
      ],
    );
  }

  static Widget setTimeTablet({required HomeController controller, required window, required context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(controller.timeString.value,
          style: TextStyle(fontSize: window.size.shortestSide * 0.2, color: Theme.of(context).dividerColor),),
        SizedBox(width: window.size.shortestSide * 0.07,),
        Column(
          children: [
            Text(controller.monthDay.value,
              style: TextStyle(fontSize: window.size.shortestSide * 0.08),),
            Text(controller.week.value,
              style: TextStyle(fontSize: window.size.shortestSide * 0.07),),
          ],
        ),
      ],
    );
  }


  static Widget setWeatherMobile({required HomeController controller, required window, required context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Image.asset('assets/images/${controller.weatherCode.value}.png', height: 100, width: 100,)
            )
        ),
        Expanded(
            child: Column(
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.temp.value.toInt() > 0 ? "+${controller.temp.value.toInt().toString()}" : "-${controller.temp.value.toInt().toString()}",
                        style: TextStyle(fontSize: window.size.shortestSide * 0.23, fontWeight: FontWeight.w300),),
                      Container(
                        margin: EdgeInsets.only(top: window.size.shortestSide * 0.06),
                        width: window.size.shortestSide * 0.06,
                        height: window.size.shortestSide * 0.06,
                        decoration: BoxDecoration(
                            border: Border.all(width: window.size.shortestSide * 0.008, color: Theme.of(context).canvasColor),
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                    ],
                  ),
                ),
                Text("${controller.region.value[0].toUpperCase()}${controller.region.value.substring(1).toLowerCase()}",
                  style: TextStyle(fontSize: window.size.shortestSide * 0.115, fontWeight: FontWeight.w300),)
              ],
            )
        ),
      ],
    );
  }

  static setWeatherTablet({required HomeController controller, required window, required context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 30),
                child: Image.asset('assets/images/${controller.weatherCode.value}.png',height: window.size.shortestSide * 0.23,width: window.size.shortestSide * 0.23,)
            )
        ),
        Expanded(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(controller.temp.value.toInt() > 0 ? "+${controller.temp.value.toInt().toString()}" : "-${controller.temp.value.toInt().toString()}",
              style: TextStyle(fontSize: window.size.shortestSide * 0.15, fontWeight: FontWeight.w300),),
            Container(
              margin: EdgeInsets.only(top: window.size.shortestSide * 0.045),
              width: window.size.shortestSide * 0.04,
              height: window.size.shortestSide * 0.04,
              decoration: BoxDecoration(
                  border: Border.all(width: window.size.shortestSide * 0.005, color: Theme.of(context).canvasColor),
                  borderRadius: BorderRadius.circular(50)
              ),
            ),
          ],
          ),
        ),
        Expanded(
            child: Text("${controller.region.value[0].toUpperCase()}${controller.region.value.substring(1).toLowerCase()}",
              style: TextStyle(fontSize: window.size.shortestSide * 0.08, fontWeight: FontWeight.w300),)
        ),
      ],
    );
  }

}