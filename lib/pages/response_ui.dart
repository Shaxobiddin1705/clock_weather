import 'package:flutter/cupertino.dart';

class ResponseUi extends StatelessWidget {
  Widget mobile;
  Widget table;
  Widget desktop;

  ResponseUi(
      {Key? key,
      required this.mobile,
      required this.table,
      required this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxHeight < 768) {
        return mobile;
      } else if (constraints.minHeight <= 768 && constraints.maxHeight < 1024) {
        return table;
      }
      return desktop;
    });
  }
}
