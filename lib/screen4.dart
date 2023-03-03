import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:figmadesign/common.dart';
import 'package:figmadesign/model/cardata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenFourPage extends StatefulWidget {
  const ScreenFourPage({Key? key}) : super(key: key);

  @override
  State<ScreenFourPage> createState() => _ScreenFourPageState();
}

class _ScreenFourPageState extends State<ScreenFourPage> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    // TODO: implement initState
    carList = Common().carData();
    super.initState();
  }

  List<Car> carList = [];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        selectedFontSize: 10,
        selectedIconTheme:
            const IconThemeData(color: Colors.amberAccent, size: 40),
        selectedItemColor: Colors.orange,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.car_repair,
              color: Colors.black,
            ),
            label: 'Repair',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.miscellaneous_services,
              color: Colors.black,
            ),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message_rounded,
              color: Colors.black,
            ),
            label: 'Consultation',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              height: 280,
              color: Colors.orange,
              child: Stack(
                children: [
                  Positioned(
                    top: -10,
                    right: 5,
                    child: SvgPicture.asset(
                      "assets/screen4/icon/ring.svg",
                    ),
                  ),
                  Positioned(
                    top: 33,
                    left: 80,
                    child: SvgPicture.asset(
                      "assets/screen4/icon/circle.svg",
                    ),
                  ),
                  Positioned(
                    top: 140,
                    left: -45,
                    child: SvgPicture.asset(
                      "assets/screen4/icon/ring.svg",
                    ),
                  ),
                  _appRow(),
                  Positioned(
                    top: 30,
                    left: 10,
                    right: 10,
                    child: Common.textField(
                        text: "Search",
                        prefixIcon: const Icon(Icons.search),
                        fillColor: Colors.white),
                  ),
                  Positioned(
                    top: 110,
                    left: 10,
                    right: 10,
                    child: Common.imageSlider(item: _imageSlider()),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: carList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _listItem(index);
                  }),
            )
          ],
        ),
      ),
    );
  }
 Widget _imageSlider(){
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Common.customText(
              text: "Get \servives \from home",
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.black),
          Image.asset(
            "assets/screen1/icon/image1.png",
            height: 100,
            width: 100,
          ),
        ],
      ),
    );
 }
  Widget _listItem(int index) {
    Car car = carList[index];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Common.customContainer(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(12),
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            child: Image.asset(car.image),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/screen4/icon/clock.svg"),
                  const SizedBox(
                    width: 10,
                  ),
                  Common.customText(
                      text: car.time,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.orange),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Common.customText(
                  text: car.name,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
              Common.customText(
                  text: car.address,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ],
          )
        ],
      ),
    );
  }

  Widget _appRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          "assets/screen4/icon/drawer.svg",
          color: Colors.white,
        ),
        Common.customText(
            text: "Home",
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.white),
        SvgPicture.asset(
          "assets/screen4/icon/bell.svg",
          color: Colors.white,
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
