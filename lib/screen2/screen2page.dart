import 'package:figmadesign/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/userdata.dart';

class ScreenSecondPage extends StatefulWidget {
  const ScreenSecondPage({Key? key}) : super(key: key);

  @override
  State<ScreenSecondPage> createState() => _ScreenSecondPageState();
}

class _ScreenSecondPageState extends State<ScreenSecondPage> {
  @override
  void initState() {
    // TODO: implement initState
    uList = Common().getData();
    super.initState();
  }

  List<UserData> uList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: const EdgeInsets.only(left: 5,right: 5,top: 20),
        child: Column(

          children: [
            _historyRow(),
         Expanded(
           child: SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Common.customText(
                   text: "Date",
                   color: Colors.grey,
                   fontSize: 18,
                   fontWeight: FontWeight.w500,
                 ),
                 const SizedBox(
                   height: 10,
                 ),
                 _mayRow(),
                 _containerRow(),
                 ListView.builder(
                     shrinkWrap: true,
                     physics: const NeverScrollableScrollPhysics(),
                     itemCount: uList.length,
                     itemBuilder: (BuildContext context, int index) {
                       return _listviewItem(index);
                     }),
               ],
             ),
           ),
         )
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

  Widget _containerRow() {
    return Row(
      children: [
        Common.customContainer(
            color: Colors.deepPurple,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            borderRadius: BorderRadius.circular(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Common.customText(
                        text: "Transaction",
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.white),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/screen2/icon/incoming.svg',
                    ),
                  ],
                ),
                Common.customText(
                    text: "200",
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ],
            )),
        Common.customContainer(
            color: Colors.cyanAccent,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            borderRadius: BorderRadius.circular(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Common.customText(
                        text: "Tickets",
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.white),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/screen2/icon/incoming.svg',
                    ),
                  ],
                ),
                Common.customText(
                    text: "200",
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ],
            ))
      ],
    );
  }

  Widget _listviewItem(int index) {
    UserData userData = uList[index];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Common.customText(
                    text: userData.tittle,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Common.customContainer(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(20),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 30),
                      child: SvgPicture.asset(userData.svg1Image),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Common.customText(
                        text: userData.shopName,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Common.customContainer(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      child: SvgPicture.asset(userData.sImage),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Common.customText(
                        text: userData.foodName,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(userData.image),
                    const SizedBox(
                      width: 25,
                    ),
                    Common.customContainer(
                      child: Common.customText(
                          text: userData.userName,
                          fontSize: 18,
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }
}
