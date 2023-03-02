import 'package:figmadesign/common.dart';
import 'package:figmadesign/model/aboutview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class AboutmePage extends StatefulWidget {
  const AboutmePage({Key? key}) : super(key: key);


  @override
  State<AboutmePage> createState() => _AboutmePageState();
}

class _AboutmePageState extends State<AboutmePage> {
  @override
  void initState() {
    // TODO: implement initState
    aList = Common().aboutProfileData();
    super.initState();
  }

  List<AboutView> aList = [];
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
     height: 50,
       buttonBackgroundColor: Colors.brown.shade50 ,
        items: const [
          Icon(Icons.home, size: 30),
          Icon(Icons.ring_volume_rounded, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.message_rounded, size: 30),
          Icon(Icons.image_aspect_ratio, size: 30),
        ],
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 1,
            child: _profile(),
          ),
          Expanded(
            flex: 3,
            child: Container(
          color: Colors.white,
          child:  ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: aList.length,
              itemBuilder: (BuildContext context, int index) {
                return _listItem(index);
              }
          ),
            ),
          ),
        ],
      )),
    );
  }
  Widget _listItem(int index){
    AboutView aboutView = aList[index];
    return GestureDetector(
      onTap: (){
        aboutView.isSelected= !aboutView.isSelected;
        setState(() {
        });
      },
      child: Container(
        color: Colors.blue.shade50,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(aboutView.icon),
                Common.customText(text: aboutView.tittle,fontWeight: FontWeight.w700,fontSize: 14),
                SvgPicture.asset(aboutView.suffixIcon),
              ],
            ),
            Container(
              padding:const  EdgeInsets.symmetric(vertical: 10),
              height: aboutView.isSelected? 100 : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                 const  Divider(),
                  Common.customText(text: aboutView.discription),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _profile() {
    return Container(


      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Colors.purple[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(
                Icons.subdirectory_arrow_right_sharp,
                color: Colors.white,
              ),
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ],
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset("assets/screen11/icon/image11.png")),
          Common.customText(
              text: "Orlando Diggs",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white),
          Common.customText(
              text: " California, USA",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white),
          Row(
            children: [
              Expanded(
                child: Common.customText(
                    text: "120k Follower",
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Expanded(
                child: Common.customText(
                  text: "12k followingr",
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      color: Colors.deepPurple,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Common.customText(
                            text: "Edit Profie",
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                         SvgPicture.asset("assets/screen12/icon/pen.svg"),
                        ],
                      )
                  ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
