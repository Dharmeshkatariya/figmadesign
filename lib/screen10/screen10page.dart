import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:figmadesign/common.dart';
import 'package:figmadesign/model/foododer.dart';
import 'package:figmadesign/model/lapinozdata.dart';
import 'package:figmadesign/model/mcdonalditem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodOderPage extends StatefulWidget {
  const FoodOderPage({Key? key}) : super(key: key);

  @override
  State<FoodOderPage> createState() => _FoodOderPageState();
}

class _FoodOderPageState extends State<FoodOderPage> {
  int page = 0;

  CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    // TODO: implement initState
    mcdonaldList = Common().mcdonaldData();
    itemList = Common().mcdonalItem();
    foodList = Common().fastFood();
    super.initState();
  }

  List<FoodItem> foodList = [];
  List<McdonaldPage> mcdonaldList = [];
  List<McdonaldItem> itemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white38,
        buttonBackgroundColor: Colors.yellow,
        height: 65,
        backgroundColor: Colors.blueGrey,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 500),
        items: const [
          Icon(Icons.home),
          Icon(Icons.dashboard),
          Icon(Icons.margin),
          Icon(Icons.shopping_cart),
          Icon(Icons.person),
        ],
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: Colors.black,
          child: Column(
            children: [
              _homeRow(),
              const  SizedBox(height: 18,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _textFieldRow(),
                     const  SizedBox(height: 18,),
                      _imageSlider(),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: mcdonaldList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _listItem(index);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Common.customText(
                              text: "Nearby moods around you",
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.white),
                          Common.customText(
                              text: "View all",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.yellow),
                        ],
                      ),
                      SizedBox(
                        height: 900,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(8),
                            itemCount: foodList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _downList(index);
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _listItem(int index) {
    McdonaldPage mcdonaldPage = mcdonaldList[index];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Common.customText(
                text: mcdonaldPage.tittle,
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              Common.customText(text: "view all", color: Colors.yellow),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _list1(index);
                }),
          ),
        ],
      ),
    );
  }
  Widget _list1(index) {
    McdonaldItem mcdonaldItem = itemList[index];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Image.asset(mcdonaldItem.image),
          Positioned(
              bottom: 20,
              left: 50,
              child: Common.customText(
                  text: mcdonaldItem.name,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 17)),
        ],
      ),
    );
  }
  Widget _downList(int index) {
    FoodItem foodItem = foodList[index];
    return Container(
      color: Colors.white10,
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 4),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        children: [
          Image.asset(foodItem.image,fit: BoxFit.fitWidth,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.circle,
                color: Colors.green,
              ),
              Common.customText(
                  text: foodItem.name,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.orange[600])
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Common.customText(
                  text: foodItem.shopName,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              Common.customText(
                  text: "${foodItem.price}",
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.orange[600]),
            ],
          ),
          Row(
            children: [
              Common.customText(
                  text: foodItem.foodType,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
              const  Spacer(),
              Common.customText(
                  text: foodItem.time,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
              const  SizedBox(width: 10,),
              Common.customText(
                  text: "|${foodItem.distance}km",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.orange[600]),
            ],
          ),
        ],
      ),
    );
  }
  Widget _homeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset("assets/screen10/icon/bell.svg"),
        Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.yellow[800],
                ),
                Common.customText(
                    text: "Home",
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.white),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.yellow[800],
                ),
              ],
            ),
            Common.customText(
                text: "9, suramya duplex, nr. nigam bus stand.....",
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.white),
          ],
        ),
        SvgPicture.asset("assets/screen10/icon/heart.svg"),
      ],
    );
  }
  Widget _textFieldRow() {
    return Row(
      children: [
        Expanded(
          child: Common.textField(
            text: "Name ur mood...",
            fillColor: Colors.yellow.shade50,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Icon(Icons.mic),
          ),
        ),

      ],
    );
  }
  Widget _imageSlider() {
    return CarouselSlider(
      items: [
        Stack(
          children: [
            Image.asset("assets/screen10/icon/offer.png"),
            Positioned(
                left: 80,
                bottom: 40,
                child: Image.asset("assets/screen10/icon/t1.png")),
            Positioned(
                left: 10,
                bottom: 10,
                child: Common.customText(
                    text: "60% off",
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.orange)),
            Positioned(
                left: 10,
                bottom: 40,
                child: Common.customText(
                    text: "Get your first order at",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
            Positioned(
                right: 10,
                bottom: 10,
                child: Common.customText(
                    text: "*Only available for new foodies.",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white)),
          ],
        )
      ],
      carouselController: buttonCarouselController,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        aspectRatio: 2.0,
        initialPage: 0,
      ),
    );
  }
}
