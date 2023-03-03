
import 'package:carousel_slider/carousel_slider.dart';
import 'package:figmadesign/common.dart';
import 'package:figmadesign/model/meals-data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/shopdata.dart';

class FoodScreenPage extends StatefulWidget {
  const FoodScreenPage({Key? key}) : super(key: key);

  @override
  State<FoodScreenPage> createState() => _FoodScreenPageState();
}

class _FoodScreenPageState extends State<FoodScreenPage> {
  int selectedIndex = 0; //New


  @override
  void initState() {
    // TODO: implement initState
    sList = Common().gShopData();
    mList = Common().mealsData();
    super.initState();
  }

  List<Shop> sList = [];
  List<Meals> mList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        //New
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.orange,
        unselectedIconTheme: const IconThemeData(
          color: Colors.blueGrey,
        ),

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.yellow,
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _searchRow(),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _labelRow(),
                     Common.imageSlider(item: _imageSlider()),
                      SizedBox(
                        height: 145,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: sList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _listItem(index);
                            }),
                      ),
                     const  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Common.customText(
                          text: "Popular Meals",
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                      Common.customText(
                          text: "view all",
                          fontWeight: FontWeight.w500,
                          fontSize: 15,color: Colors.orange),
                    ],
                  ),
                      const  SizedBox(height: 10,),
                      SizedBox(
                        height: 340,
                        child: GridView.count(
                          shrinkWrap:true,
                          physics: NeverScrollableScrollPhysics(),
                            primary: false,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            children: List.generate(
                                mList.length, (index) => _gridItem(index))),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _listItem(int index) {
    Shop shop = sList[index];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(shop.fImage),
          Common.customText(
              text: shop.fName, fontSize: 12, fontWeight: FontWeight.w400),
        ],
      ),
    );
  }

  Widget _gridItem(int index) {
    Meals meals = mList[index];
    return Stack(
      children: [
        Image.asset(
          meals.mImage,
          fit: BoxFit.fitHeight,
          height: 110,
        ),
        Positioned(
            top: -2,
            right: 0,
            child: SvgPicture.asset("assets/screen9/icon/heart9.svg")),
        Positioned(
            left: 2,
            bottom: 20,
            child: Common.customText(
                text: meals.mName, fontSize: 14, fontWeight: FontWeight.w800)),
        Positioned(
          left: 2,
          bottom: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Common.customText(text: "price #${meals.mPrice}"),
              SizedBox(
                  width: 100,
                  child: SvgPicture.asset("assets/screen9/icon/cart.svg")),
            ],
          ),
        )
      ],
    );
  }

  Widget _searchRow() {
    return Row(
      children: [
        SvgPicture.asset("assets/screen9/icon/drawer9.svg"),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Common.textField(
                text: "Find meals or restaurants ",
                fillColor: Colors.yellow.shade100,
                suffixIcon: const Icon(
                  Icons.search_rounded,
                  color: Colors.red,
                ))),
        const SizedBox(
          width: 20,
        ),
        const Icon(
          Icons.shopping_cart_rounded,
          color: Colors.black,
        )
      ],
    );
  }

  Widget _labelRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Common.customContainer(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            borderRadius: BorderRadius.circular(20),
            color: Colors.yellow.shade900,
            child: Common.customText(
                text: "Meals",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white)),
        Common.customContainer(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            borderRadius: BorderRadius.circular(20),
            color: Colors.orange.shade100,
            child: Common.customText(
                text: "Restaurants",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black))
      ],
    );
  }

  Widget _imageSlider() {
    return Stack(
      children: [
        Image.asset(
          "assets/screen9/icon/image9.png",
        ),
        Positioned(
            bottom: 65,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange[300],
                borderRadius: BorderRadius.circular(12),
              ),
              padding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Common.customText(
                  text: "Fried Rice",
                  fontWeight: FontWeight.w700,
                  fontSize: 8,
                  color: Colors.white),
            )),
        Positioned(
            bottom: 30,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange[300],
                borderRadius: BorderRadius.circular(12),
              ),
              padding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Common.customText(
                  text: "#3500",
                  fontWeight: FontWeight.w700,
                  fontSize: 8,
                  color: Colors.white),
            )),
      ],
    );
  }

  _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
