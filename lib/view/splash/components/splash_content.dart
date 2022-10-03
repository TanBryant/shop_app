import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({Key? key, required this.text, required this.image})
      : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "IVY moda Store",
          style: TextStyle(
            fontSize: getProportionateScreenHeight(40),
            color: Color.fromARGB(255, 14, 13, 13),
            fontWeight: FontWeight.bold,
          ),
        ),
        // Text("Wellcome to Namphan0211 , Let's shop!"),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image!,
          //  "assets/images/splash_1.png"
          height: getProportionateScreenHeight(300),
          width: getProportionateScreenWidth(350),
        ),
      ],
    );
  }
}
