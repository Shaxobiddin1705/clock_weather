import 'package:clock_weather/pages/response_ui.dart';
import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponseUi(table: table(),mobile: mobileUI(),desktop: desktop(),),
    );
  }

  mobileUI(){

  }

  table(){}

  desktop(){}
}
