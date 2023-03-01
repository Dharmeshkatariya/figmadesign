import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:figmadesign/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
class FoodOderPage extends StatefulWidget{
  const FoodOderPage({Key? key}) : super(key: key);

  @override
  State<FoodOderPage> createState() => _FoodOderPageState();
}

class _FoodOderPageState extends State<FoodOderPage> {

  int page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: CurvedNavigationBar(
      color: Colors.white38,
        buttonBackgroundColor: Colors.yellow,
        height: 65,
        backgroundColor: Colors.blueGrey,
        animationCurve: Curves.easeInOut,
        animationDuration:const  Duration(milliseconds: 500),
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
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          color: Colors.black,
          child: Column(
            children: [
             _homeRow(),
            _textFieldRow(),
              CarouselSlider(
                items: [Stack(
                  children: [
                    Image.asset("assets/screen10/icon/offer.png"),
                    Positioned(
                        left: 80,
                        bottom: 40,
                        child: Image.asset("assets/screen10/icon/t1.png")),
                    Positioned(
                        left: 10,
                        bottom: 10,
                        child: Common.customText(text: "60% off",fontSize: 22,fontWeight: FontWeight.w700,color: Colors.orange)),
                    Positioned(
                        left: 10,
                        bottom: 40,
                        child: Common.customText(text: "Get your first order at",fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white)),
                    Positioned(
                        right: 10,
                        bottom: 10,
                        child: Common.customText(text: "*Only available for new foodies.",fontSize: 12,fontWeight: FontWeight.w400,color: Colors.white)),
                  ],
                )] ,
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  aspectRatio: 2.0,
                  initialPage: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _homeRow(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset("assets/screen10/icon/bell.svg"),
        Column(
          children: [
            Row(
              children: [
                Icon(Icons.location_on,color: Colors.yellow[800],),
                Common.customText(text: "Home",fontWeight: FontWeight.w700,fontSize: 18,color: Colors.white),
                Icon(Icons.keyboard_arrow_down,color: Colors.yellow[800],),
              ],
            ),
            Common.customText(text: "9, suramya duplex, nr. nigam bus stand.....",fontWeight: FontWeight.w400,fontSize: 12,color: Colors.white),
          ],
        ),
        SvgPicture.asset("assets/screen10/icon/heart.svg"),
      ],
    );
  }
  Widget _textFieldRow(){
    return  Row(
      children: [
        Expanded(
          child: Common.textField(text: "Name ur mood...",
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Icon(Icons.mic),
          ),
        ),
        const  Icon(Icons.receipt_sharp,color: Colors.white,)
      ],
    );
  }
}
