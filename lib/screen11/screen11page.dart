import 'package:figmadesign/common.dart';
import 'package:figmadesign/model/bestfood.dart';
import 'package:figmadesign/model/grillchicken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



import 'package:google_nav_bar/google_nav_bar.dart';

class GrillFoodPage extends StatefulWidget {
  const GrillFoodPage({Key? key}) : super(key: key);

  @override
  State<GrillFoodPage> createState() => _GrillFoodPageState();
}

class _GrillFoodPageState extends State<GrillFoodPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foodList = Common().bestFoodData();
    grillList = Common().grillChickenData();
  }

  List<BestFood> foodList = [];
  List<GrillData> grillList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
          haptic: true,
          rippleColor: Colors.cyan,
          tabBorderRadius: 15,
          tabActiveBorder: Border.all(color: Colors.black, width: 1),
          tabBorder: Border.all(color: Colors.grey, width: 1),
          tabShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
          ],
          curve: Curves.easeInOutSine,
          duration: const Duration(milliseconds: 500),
          gap: 6,
          color: Colors.black,
          activeColor: Colors.red[900],
          iconSize: 23,
          tabBackgroundColor: Colors.yellow.withOpacity(0.5),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          tabs: const  [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.doorbell,
              text: 'alert',
            ),
            GButton(
              icon: Icons.shopping_bag_outlined,
              text: 'Items',
            ),
            GButton(
              icon: Icons.settings,
              text: 'Setting',
            )
          ]
      ),
      body: SafeArea(
        child: Container(
          color: Colors.yellow.shade300,
          child: Column(
            children: [
              _profileView(),
              Expanded(
                flex: 2,
                child: Common.customContainer(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(35),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: foodList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _listItem(index);
                              }),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: grillList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _listRow(index);
                              }),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listRow(int index) {
    GrillData grillData = grillList[index];
    return Column(
      children: [
        Row(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.brown.shade50,
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                margin:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      grillData.image,
                      height: 50,
                      fit: BoxFit.fitHeight,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Common.customText(
                        text: grillData.name,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Common.customText(
                            text: grillData.time,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.black),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Common.customText(
                            text: " 4.5",
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.grey),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Common.customText(
                            text: "${grillData.price}",
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.black),
                        const SizedBox(
                          width: 25,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 3),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                          width: 3,
                        )),
                    child: Common.customText(
                        text: "Mor",
                        fontSize: 13,
                        fontWeight: FontWeight.w400)),
                Common.customContainer(
                    borderRadius: BorderRadius.circular(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Common.customText(text: grillData.name),
                            const SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset("assets/screen11/icon/heart.svg"),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(grillData.image),
                            const SizedBox(
                              width: 5,
                            ),
                            Common.customText(text: grillData.time),
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Common.customText(text: "4.5"),
                          ],
                        ),
                        Common.customText(text: "Rs ${grillData.price}"),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    color: Colors.brown.shade50),
                Common.customContainer(
                    borderRadius: BorderRadius.circular(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Common.customText(text: grillData.name),
                            const SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset("assets/screen11/icon/heart.svg"),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(grillData.image),
                            const SizedBox(
                              width: 5,
                            ),
                            Common.customText(text: grillData.time),
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Common.customText(text: "4.5"),
                          ],
                        ),
                        Common.customText(text: "Rs ${grillData.price}"),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    color: Colors.brown.shade50),
              ],
            )
          ],
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Common.customText(
                  text: "Best Food",
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 145,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _bestFood(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bestFood(int index) {
    BestFood bestFood = foodList[index];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            bestFood.image,
            fit: BoxFit.cover,
          ),
          Common.customText(text: bestFood.name),
          Common.customText(text: "Rs ${bestFood.price}"),
          Common.customContainer(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.yellow[500],
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }

  Widget _listItem(int index) {
    BestFood bestFood = foodList[index];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Common.customText(
          text: bestFood.itemName, fontSize: 16, fontWeight: FontWeight.w400),
    );
  }

  Widget _profileView() {
    return Common.customContainer(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding:
        const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  "assets/screen11/icon/drwaer11.svg",
                  color: Colors.black,
                ),
                Image.asset("assets/screen11/icon/image11.png"),
              ],
            ),
            Common.customText(
                text: "Best food \nfree Delivered",
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.black),
            Common.textField(
                text: "Search food and restaurants",
                suffixIcon: const Icon(Icons.search),
                fillColor: Colors.orange[100]),
          ],
        ));
  }
}
