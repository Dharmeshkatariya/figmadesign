import 'package:figmadesign/common.dart';
import 'package:figmadesign/model/contactdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  void initState() {
    // TODO: implement initState
    mList = Common().setData();
    super.initState();
  }
  List<User> mList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:const  Color(0xFF1D6D5D),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: 'Wallet',
            icon: Icon(Icons.wallet),
          ),
          BottomNavigationBarItem(
            label: 'Location',
            icon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            label: 'person',
            icon: Icon(Icons.person),
          ),
        ],
      ) ,
      body: SafeArea(
        child: Container(
          margin:const  EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _contactRow(),
              const SizedBox(
                height: 20,
              ),
              Common.customText(
                  text: "Recent Contact",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black),
              SizedBox(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    itemCount: mList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _listItem(index);
                    }),
              ),
              Common.customText(
                  text: "All Contact",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black),

              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: mList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _listView(index);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contactRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            "assets/screen3/icon/back.svg",
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Common.customText(
          text: "Contact List",
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        )
      ],
    );
  }

  Widget _listItem(int index) {
    User user = mList[index];
    return Common.customContainer(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration:const BoxDecoration(
              color: Colors.pink,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              user.image,
              fit: BoxFit.fill,
            ),
          ),
          Common.customText(text: user.name),
        ],
      ),
    );
  }

  Widget _listView(int index) {
    User user = mList[index];
    return Common.customContainer(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.cyan,
              shape: BoxShape.circle,
            ),
            child: Common.customText(
                text: user.eName, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Common.customText(
                  text: user.name,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.black),
              Common.customText(
                  text: "${user.mobile}",
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: Colors.black),
            ],
          )
        ],
      ),
    );
  }
}
