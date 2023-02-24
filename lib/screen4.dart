import 'package:figmadesign/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenFourPage extends StatelessWidget {
  const ScreenFourPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 300,
                color: Colors.orange,
                child: Stack(
                  children: [
                    Positioned(
                      top: -10,
                      right: 5,
                      child: SvgPicture.asset(
                        "assets/screen4/icon/ring.svg",
                      ),
                    ),
                    Positioned(
                      top: 33,
                      left: 80,
                      child: SvgPicture.asset(
                        "assets/screen4/icon/circle.svg",
                      ),
                    ),
                    Positioned(
                      top: 140,
                      left: -45,
                      child: SvgPicture.asset(
                        "assets/screen4/icon/ring.svg",
                      ),
                    ),
                   _appRow(),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _appRow(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          "assets/screen4/icon/drawer.svg",
          color: Colors.white,
        ),
        Common.customText(
            text: "Home",
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.white),
        SvgPicture.asset(
          "assets/screen4/icon/bell.svg",
          color: Colors.white,
        ),
      ],
    );
  }
}
