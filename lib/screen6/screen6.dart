import 'package:figmadesign/common.dart';
import 'package:figmadesign/model/vegatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  void initState() {
    // TODO: implement initState
    vList = Common().vegatableData();
    super.initState();
  }

  List<Vegatable> vList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 210,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 80,
                    bottom: 80,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          "assets/screen6/icon/backaero6.svg",
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    bottom: -10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
                      child: SvgPicture.asset(
                        "assets/screen6/icon/heart.svg",
                      ),
                    ),
                  ),
                  _starPosition(),
                ],
              ),
              Expanded(
                child: _bottomContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _starPosition() {
    return Positioned(
      left: 40,
      bottom: -10,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              "assets/screen6/icon/circle6.svg",
              color: Colors.black26,
            ),
            SvgPicture.asset("assets/screen6/icon/circle6.svg"),
            SvgPicture.asset("assets/screen6/icon/circle6.svg"),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Common.customText(text: "4.5"),
          ],
        ),
      ),
    );
  }

  Widget _bottomContainer() {
    return Container(
     padding:const  EdgeInsets.only(left: 15,top: 35,right: 15,bottom: 10),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45), topRight: Radius.circular(45)),
      ),
      child: SingleChildScrollView(
        child: Column(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Common.customText(
                text: "Rice With Green Peas\nAnd Shrimps",
                fontSize: 25,
                fontWeight: FontWeight.w700),
            const SizedBox(height: 15,),
            _counterRow(),
            const SizedBox(height: 15,),
            Common.customText(
                text: "À propos de", fontWeight: FontWeight.w400, fontSize: 18),
            const SizedBox(height: 15,),
            Common.customText(
                text:
                    "Ce plat de crevettes, pois et riz est le préféré de toute la famille !\nIl est rapide à cuisiner et ne nécessite aucun hachage, facile.",
                fontWeight: FontWeight.w400,
                fontSize: 10),
            const SizedBox(height: 25,),
            Common.customText(
                text: "Ingrédients", fontSize: 18, fontWeight: FontWeight.w400),
            SizedBox(
              height: 90,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: vList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _listView(index);
                  }),
            ),

            Common.customContainer(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 23),
              color: Colors.orange.shade800,
              child: Common.customText(
                  text: "Suivant",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              borderRadius: BorderRadius.circular(30),
            )
          ],
        ),
      ),
    );
  }

  Widget _listView(int index) {
    Vegatable vegatable = vList[index];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          SvgPicture.asset(vegatable.vegImage),
          Common.customText(
              text: vegatable.vegName,
              fontWeight: FontWeight.w500,
              fontSize: 12),
        ],
      ),
    );
  }

  Widget _counterRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Common.customText(
            text: "45.00C", fontSize: 30, fontWeight: FontWeight.w600),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
            ),
            child: Common.customText(
                text: "-", fontWeight: FontWeight.w500, fontSize: 30)),
        Common.customText(text: "5", fontSize: 30, fontWeight: FontWeight.w500),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.orange),
            ),
            child: Common.customText(
                text: "+", fontWeight: FontWeight.w500, fontSize: 28,color: Colors.orange)),
      ],
    );
  }
}
