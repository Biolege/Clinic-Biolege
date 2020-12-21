import 'package:flutter/material.dart';

Column buildSplashContent(String mainLogo, String subLogo) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        mainLogo,
        height: 60,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(),
          Image.asset(
            subLogo,
            height: 30,
          ),
        ],
      ),
    ],
  );
}
