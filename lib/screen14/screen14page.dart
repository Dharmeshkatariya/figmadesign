import 'package:figmadesign/common.dart';
import 'package:figmadesign/model/clothshopping_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';


class ClothesPage extends StatefulWidget {
  const ClothesPage({Key? key}) : super(key: key);

  @override
  State<ClothesPage> createState() => _ClothesPageState();
}

class _ClothesPageState extends State<ClothesPage> {
  @override
  void initState() {
    // TODO: implement initState
    dressList = Common().fashionData();
    super.initState();
  }

  List<BoysFashion> dressList = [];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MoltenBottomNavigationBar(
        domeCircleColor: Colors.orange,
        domeCircleSize: 40,
        barHeight: 50,
        duration: const Duration(milliseconds: 400) ,
        barColor: Colors.blue.shade50,
        selectedIndex: _selectedIndex,
        onTabChange: (clickedIndex) {
          setState(() {
            _selectedIndex = clickedIndex;
          });
        },
        tabs: [
          MoltenTab(
            icon: const Icon(Icons.home_filled),
          ),
          MoltenTab(
            icon: const Icon(Icons.shopping_cart_rounded),
          ),
          MoltenTab(
            icon:const Icon(Icons.heart_broken_rounded),
          ),
          MoltenTab(
            icon:const Icon(Icons.person),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _mainRow(),
             const  SizedBox(height: 15,),
              Common.customText(
                  text: "Explore \nBest Outfits for you",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.blueGrey),
              const  SizedBox(height: 15,),
              Common.textField(
                  fillColor: Colors.white,
                  text: "Search items...",
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                  ),
                  suffixIcon: const Icon(
                    Icons.filter_2_rounded,
                    color: Colors.orange,
                  )),
              const  SizedBox(height: 5,),
              Expanded(child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dressList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _clothItem(index);
                          }),
                    ),
                    const  SizedBox(height: 10,),
                    _textRow("Today’s Deal"),
                    const  SizedBox(height: 15,),
                    SizedBox(
                      height: 155,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dressList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _boyFashionList(index);
                          }),
                    ),
                    const  SizedBox(height: 15,),
                    _textRow("Popular"),
                    const  SizedBox(height: 15,),
                    SizedBox(
                      height: 155,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dressList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _boyFashionList(index);
                          }),
                    ),
                    const  SizedBox(height: 15,),
                    _textRow("New Arrival"),
                    const  SizedBox(height: 15,),
                    GridView.count(
                        primary: false,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: List.generate(dressList.length, (index) => _boyFashionList(index))
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textRow(text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Common.customText(
            text: text, fontWeight: FontWeight.w500, fontSize: 20),
        Common.customText(
            text: "See all", fontWeight: FontWeight.w400, fontSize: 14),
      ],
    );
  }

  Widget _boyFashionList(int index) {
    BoysFashion boysFashion = dressList[index];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              boysFashion.boysImage,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Common.customText(
                  text: boysFashion.typeName,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
              Common.customText(
                  text: " Rs ${boysFashion.price}",
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ],
          )
        ],
      ),
    );
  }

  Widget _clothItem(int index) {
    BoysFashion boysFashion = dressList[index];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          Image.asset(boysFashion.dressImage),
          Common.customText(
              text: boysFashion.dressName,
              fontSize: 12,
              fontWeight: FontWeight.w500)
        ],
      ),
    );
  }

  Widget _mainRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset("assets/screen14/icon/drawer14.svg"),
        Spacer(),
        const Icon(Icons.location_on),
        Common.customText(text: "15/2 New Texas"),
        Spacer(),
        SvgPicture.asset("assets/screen14/icon/noti14.svg"),
      ],
    );
  }
}
