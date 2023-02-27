import 'package:figmadesign/common.dart';
import 'package:figmadesign/model/artdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenFive extends StatefulWidget {
  const ScreenFive({Key? key}) : super(key: key);

  @override
  State<ScreenFive> createState() => _ScreenFiveState();
}

class _ScreenFiveState extends State<ScreenFive> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    aList = Common().artData();
  }

  List<Art> aList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(

              children: [
                _appRow(),
const SizedBox(height: 20,),
                Stack(
                  children: [
                    Image.asset("assets/screen5/icon/image5.png"),
                    Positioned(
                      top: 40,
                      right: 110,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            "assets/screen5/icon/circleimage5.png",
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Common.customText(
                    text: "Explore Art",
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                const SizedBox(height: 10,),
                Common.customText(
                    text:
                        "Lorem Ipsum has been the industry dummy \ntext ever since the 1500s, when an unknown \nprinter. Read more....",
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                const SizedBox(height: 15,),
                _iconRow(),
                const SizedBox(height: 25,),
                _textRow(),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.propane_tank,
                      color: Colors.blue,
                    ),
                    Common.customText(text: "Ranking", color: Colors.blue),
                    const Icon(Icons.local_activity),
                    Common.customText(text: "Activity"),
                  ],
                ),
                const SizedBox(height: 15,),
                Common.textField(
                    text: "Search",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.filter)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: aList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _containerData(index);
                        }),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _containerData(int index) {
    Art art = aList[index];
    return Container(
      padding:const  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      margin:const  EdgeInsets.symmetric(vertical: 5,horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.blue.shade100,
      ),
      child: Common.customText(
          text: art.artName,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.black),
    );
  }

  Widget _appRow() {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset("assets/screen5/icon/back.svg")),
        const SizedBox(
          width: 20,
        ),
        Common.customText(
            text: "Art",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black),
        const Spacer(),
        SvgPicture.asset("assets/screen5/icon/share5.svg"),
        const SizedBox(
          width: 20,
        ),
        SvgPicture.asset("assets/screen5/icon/dotshare.svg"),
      ],
    );
  }

  Widget _iconRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset("assets/screen5/icon/game.svg"),
        SvgPicture.asset("assets/screen5/icon/twitter.svg"),
        SvgPicture.asset("assets/screen5/icon/insta.svg"),
        SvgPicture.asset("assets/screen5/icon/teligram.svg"),
      ],
    );
  }

  Widget _textRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Common.customText(
                text: "10K",
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black),
            Common.customText(
                text: "Items",
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.black),
          ],
        ),
        Column(
          children: [
            Common.customText(
                text: "4.7k",
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black),
            Common.customText(
                text: "Owners",
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.black),
          ],
        ),
        Column(
          children: [
            Common.customText(
                text: "10K",
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black),
            Common.customText(
                text: "Flood price",
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.black),
          ],
        ),
        Column(
          children: [
            Common.customText(
                text: "299k",
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black),
            Common.customText(
                text: "Total value",
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.black),
          ],
        ),
      ],
    );
  }
}
