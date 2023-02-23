import 'package:figmadesign/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({Key? key}) : super(key: key);

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  bool isSelected = false;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/screen1/icon/aero.svg'),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          isVisible = !isVisible;
                          setState(() {});
                        },
                        child: SvgPicture.asset(
                          'assets/screen1/icon/heart.svg',
                          color: isVisible ? Colors.red : Colors.black,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: (){
                         
                          setState(() {

                          });
                        }
                        ,
                        child: SvgPicture.asset('assets/screen1/icon/share.svg')),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          PopupMenuButton(
                            child: Container(height: 20,),
                            itemBuilder: (ctx) => [
                              _buildPopupMenuItem('Search', Icons.search),
                              _buildPopupMenuItem('Upload', Icons.upload),
                              _buildPopupMenuItem('Copy', Icons.copy),
                              _buildPopupMenuItem('Exit', Icons.exit_to_app),
                            ],
                          );

                          setState(() {});
                        },
                        child: SvgPicture.asset('assets/screen1/icon/dot.svg')),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/screen1/icon/image1.png",
                  height: 339,
                  width: 335,
                ),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  "Hard Face Art #7",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Common.customText(
                        text: "Hardfaceart",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset('assets/screen1/icon/click.svg'),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                _iconRow(),
                const SizedBox(
                  height: 10,
                ),
                _bigTextRow(),
                const SizedBox(
                  height: 10,
                ),
                _smallTextRow(),
                const SizedBox(
                  height: 15,
                ),
                Common.customText(
                    text: "ends on thursday ,december 27,2022 at\n 19:00pm ",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.black),
                _buttonRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset('assets/screen1/icon/heartsmall.svg'),
        SvgPicture.asset('assets/screen1/icon/people.svg'),
        SvgPicture.asset('assets/screen1/icon/square.svg'),
        SvgPicture.asset('assets/screen1/icon/eye.svg'),
      ],
    );
  }

  Widget _bigTextRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Common.customText(
            text: "83", fontSize: 20, fontWeight: FontWeight.w600),
        Common.customText(text: "1", fontSize: 20, fontWeight: FontWeight.w600),
        Common.customText(text: "1", fontSize: 20, fontWeight: FontWeight.w600),
        Common.customText(
            text: "4137", fontSize: 20, fontWeight: FontWeight.w600),
      ],
    );
  }

  Widget _smallTextRow({String? text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Common.customText(
            text: "favourites",
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 12),
        Common.customText(
            text: "owners",
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 12),
        Common.customText(
            text: "editions",
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 12),
        Common.customText(
            text: "visitors",
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 12),
      ],
    );
  }

  Widget _buttonRow() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            isSelected = !isSelected;
            setState(() {});
          },
          child: Common.containerButton(
            borderRadius: BorderRadius.circular(25),
            color: isSelected ? Colors.white : Colors.blue,
            child: Row(
              children: [
                SvgPicture.asset('assets/screen1/icon/make.svg'),
                const SizedBox(
                  width: 8,
                ),
                Common.customText(
                    text: "Make Offer",
                    color: isSelected ? Colors.blue : Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            isSelected = !isSelected;
            setState(() {});
          },
          child: Common.containerButton(
            borderRadius: BorderRadius.circular(25),
            color: isSelected ? Colors.blue : Colors.white,
            child: Row(
              children: [
                SvgPicture.asset('assets/screen1/icon/buyicon.svg'),
                const SizedBox(
                  width: 8,
                ),
                Common.customText(
                    text: "Buy Now",
                    color: isSelected ? Colors.white : Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ],
            ),
          ),
        )
      ],
    );
  }
  PopupMenuItem _buildPopupMenuItem(
      String title, IconData iconData) {
    return PopupMenuItem(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      child:  Row(
        children: [
          Icon(iconData, color: Colors.black,),
          Text(title),
        ],
      ),
           );
}}
