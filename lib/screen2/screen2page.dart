import 'package:figmadesign/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenSecondPage extends StatelessWidget {
  const ScreenSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        margin:const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            _historyRow(),
            Common.customText(
              text: "Date",
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            _mayRow(),
          ],
        ),
      ),
    );
  }

  Widget _historyRow() {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.deepPurple[400],
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 20),
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: SvgPicture.asset(
            'assets/screen2/icon/arrowtop.svg',
          ),
        ),
        Common.customText(
            text: "History",
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20)
      ],
    );
  }

  Widget _mayRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            SvgPicture.asset(
              'assets/screen2/icon/box.svg',
            ),
            Positioned(
              top: 5,
              bottom: 5,
              left: 5,
              right: 5,
              child: SvgPicture.asset(
                'assets/screen2/icon/minus.svg',
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Common.customText(
              text: "May",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        )
      ],
    );
  }
  Widget _containerRow(){
    return Row(
      children: [
        Common.containerButton(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(12),
          child:Column(
            children: [
              Row(
                children: [
                  Common.customText(text: "Transaction",fontWeight: FontWeight.w400,fontSize: 12,color: Colors.white),
                  SvgPicture.asset(
                    'assets/screen2/icon/incoming.svg',
                  ),
                ],
              ),
              Common.customText(text: "")
            ],
          )
        )
      ],
    );
  }
}
