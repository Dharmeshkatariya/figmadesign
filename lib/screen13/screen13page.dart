import 'package:carousel_slider/carousel_slider.dart';
import 'package:figmadesign/common.dart';
import 'package:figmadesign/model/Statesdata.dart';
import 'package:figmadesign/model/bunglahouse.dart';
import 'package:figmadesign/model/homedata.dart';
import 'package:flutter/material.dart';

class HousePage extends StatefulWidget {
  const HousePage({Key? key}) : super(key: key);

  @override
  State<HousePage> createState() => _HousePageState();
}

class _HousePageState extends State<HousePage> {
  @override
  void initState() {
    aList = Common().homeDetail();
    hList = Common().apartmentData();
    homeList = Common().bunglaData();
    // TODO: implement initState
    super.initState();
  }

  CarouselController buttonCarouselController = CarouselController();
  List<HouseData> aList = [];
  List<Estates> hList = [];
  List<BunglaHouse> homeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _profileRow(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Common.customText(
                        text: "Hey, Jonathan! \nLet's start exploring ",
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: Colors.green[900]),
                    const SizedBox(
                      height: 10,
                    ),
                    Common.textField(
                      text: "Search House, Apartment, etc",
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: const Icon(Icons.mic),
                    ),
                    const   SizedBox(height: 10,),
                    SizedBox(
                      height: 45,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: aList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _allList(index);
                          }),
                    ),
                    const   SizedBox(height: 10,),
                    _imageSlider(),
                    const   SizedBox(height: 20,),
                    _featureRow("Featured Estates"),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _featureEstates(index);
                          }),
                    ),
                    _featureRow("Top Location"),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,

                          itemCount: aList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _locationList(index);
                          }),
                    ),
                    _featureRow("Top Estate Agent"),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: aList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _personList(index);
                          }),
                    ),
                    _featureRow("Explore Nearby Estates"),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      primary: false,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2,
                      children: List.generate(
                        homeList.length,
                        (index) => _gridItem(index),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
   Widget _personList(int index){
     HouseData houseData = aList[index];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin:const  EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(houseData.pImage),
          Common.customText(text: houseData.person,fontSize: 10,fontWeight: FontWeight.w500,color: Colors.blue.shade900),
        ],
      ),
    );
   }
  Widget _locationList(int index) {
    HouseData houseData = aList[index];
    return Container(
      margin:const  EdgeInsets.symmetric(horizontal: 5),
      padding:const  EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(houseData.cityImage),
          Common.customText(text: houseData.location),
        ],
      ),
    );
  }

  Widget _gridItem(int index) {
    BunglaHouse bunglaHouse = homeList[index];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.blue.shade50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            bunglaHouse.image,
          ),
          Common.customText(
              text: bunglaHouse.name,
              fontSize: 15,
              fontWeight: FontWeight.w700),
          Common.customText(
              text: "Rs${bunglaHouse.rate}\/month",
              fontSize: 15,
              fontWeight: FontWeight.w700),
          Row(

            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Common.customText(
                  text: "4.5", fontWeight: FontWeight.w700, fontSize: 8),
              const Spacer(),
              const Icon(Icons.location_on),
              Common.customText(
                  text: bunglaHouse.location,
                  fontWeight: FontWeight.w400,
                  fontSize: 8,
                  color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _featureEstates(int index) {
    Estates estates = hList[index];
    return Container(
      color: Colors.blue.shade50,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(estates.image),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Common.customText(
                  text: estates.apartment,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Common.customText(text: "4.9"),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.location_on),
                  Common.customText(text: estates.location),
                ],
              ),
              Common.customText(
                  text: "Rs ${estates.rate}\/month",
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ],
          )
        ],
      ),
    );
  }

  Widget _allList(int index) {
    HouseData houseData = aList[index];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Common.customText(
          text: houseData.name,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: Colors.white),
    );
  }

  Widget _featureRow(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Common.customText(
            text: text, fontWeight: FontWeight.w700, fontSize: 18),
        Common.customText(
            text: "view all", fontWeight: FontWeight.w400, fontSize: 12),
      ],
    );
  }

  Widget _profileRow() {
    return Row(
      children: [
        const Icon(Icons.location_on),
        Common.customText(
            text: "Jakarta, Indonesia",
            fontSize: 10,
            fontWeight: FontWeight.w500),
        const Icon(Icons.keyboard_arrow_down),
        Spacer(),
        const Icon(Icons.notification_important),
        Image.asset("assets/screen13/icon/p13.png"),
      ],
    );
  }

  Widget _imageSlider() {
    return CarouselSlider(
      items: [
        Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset("assets/screen10/icon/offer.png")),
            Positioned(
                left: 10,
                top: 40,
                child: Common.customText(
                    text: "Halloween \nSale!",
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
            Positioned(
                left: 10,
                top: 90,
                child: Common.customText(
                    text: "All discount up to 60%",
                    fontSize: 10,
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
