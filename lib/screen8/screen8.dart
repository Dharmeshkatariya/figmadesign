import 'package:figmadesign/common.dart';
import 'package:figmadesign/model/monthdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MultiPlane extends StatefulWidget {
  const MultiPlane({Key? key}) : super(key: key);

  @override
  State<MultiPlane> createState() => _MultiPlaneState();
}

class _MultiPlaneState extends State<MultiPlane> {
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    mList = Common().monthData();
    aList = Common().weeklyData();

    super.initState();
  }

  List<Month> mList = [];
  List<Month> aList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        //New
        onTap: _onItemTapped,
        iconSize: 25,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_rounded),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.featured_play_list),
            label: 'Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Basket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              _planRow(),
              Image.asset("assets/screen8/icon/plan.png"),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    itemCount: mList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _monthList(index);
                    }),
              ),
              const  SizedBox(height: 20,),
              _dateRow(),
             const  SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: aList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _listview(index);
                    }),
              ),
              Common.customContainer(
                color: Colors.green,
                borderRadius: BorderRadius.circular(18),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: Common.customText(
                    text: "View Ingredients",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _listview(int index) {
    Month month = aList[index];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Common.customText(
              text: month.day, fontSize: 15, fontWeight: FontWeight.w400),
         const  SizedBox(height: 20,),
          Image.asset(month.image),
        ],
      ),
    );
  }

  Widget _dateRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset("assets/screen8/icon/back.svg"),
        Common.customText(
            text: "4 july - 10 july",
            fontWeight: FontWeight.w500,
            fontSize: 15),
        SvgPicture.asset("assets/screen8/icon/go.svg"),
      ],
    );
  }

  Widget _monthList(int index) {
    Month month = mList[index];
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Common.customText(text: month.name),
    );
  }

  Widget _planRow() {
    return Row(
      children: [
        Common.customContainer(
          borderRadius: BorderRadius.circular(15),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Common.customText(
            text: "Single Time Plan",
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Common.customContainer(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(15),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Common.customText(
            text: " Custom Plan",
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
