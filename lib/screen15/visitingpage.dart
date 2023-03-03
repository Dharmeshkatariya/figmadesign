import 'package:figmadesign/common.dart';
import 'package:figmadesign/model/calldetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VisitorPage extends StatefulWidget {
  const VisitorPage({Key? key}) : super(key: key);

  @override
  State<VisitorPage> createState() => _VisitorPageState();
}

class _VisitorPageState extends State<VisitorPage> {
  @override
  void initState() {
    // TODO: implement initState
    detailList = Common().reviewPageData();
    super.initState();
  }

  List<DetailReview> detailList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Common.imageSlider(item: _imageSlider()),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Common.customText(
                        text: "Parallel 37",
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    Common.customText(
                        text: "Chinese, Italian",
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    const SizedBox(
                      height: 5,
                    ),
                    _reviewRow(),
                    const SizedBox(
                      height: 5,
                    ),
                    _headlineRow(),
                    const SizedBox(
                      height: 15,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: detailList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _profileList(index);
                        }),
                    _overviewRow(),
                    const Divider(),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: detailList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _listItem(index);
                        }),
                  ],
                ),
              ),
            ),
            _button(),
          ],
        ),
      )),
    );
  }

  Widget _profileList(int index) {
    DetailReview detailReview = detailList[index];
    return Container(

      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: SvgPicture.asset(detailReview.svgIcon)),
          const SizedBox(
            width: 20,
          ),
          Common.customText(text: detailReview.title),
        ],
      ),
    );
  }

  Widget _button() {
    return Common.customContainer(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 40),
        borderRadius: BorderRadius.circular(12),
        color: Colors.orange,
        child: Common.customText(
            text: "Reserve a Table",
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600));
  }

  Widget _listItem(int index) {
    DetailReview detailReview = detailList[index];
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(detailReview.image),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Common.customText(
                  text: detailReview.name,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset("assets/screen15/icon/star15.svg"),
                  const SizedBox(
                    width: 10,
                  ),
                  Common.customText(text: "${detailReview.rating}"),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Common.customText(text: detailReview.date),
              const SizedBox(
                height: 10,
              ),
              Common.customText(text: detailReview.description),
            ],
          )
        ],
      ),
    );
  }

  Widget _overviewRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Common.customText(
            text: "Overview",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black),
        Common.customText(
            text: "Reviews",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.orange.shade900),
      ],
    );
  }

  Widget _headlineRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Common.customText(
            text: "Dine-in", fontSize: 14, fontWeight: FontWeight.w400),
        Common.customText(
            text: "Takeaway", fontSize: 14, fontWeight: FontWeight.w400),
        Common.customText(
            text: "Delivery", fontSize: 14, fontWeight: FontWeight.w400),
      ],
    );
  }

  Widget _reviewRow() {
    return Row(
      children: [
        SvgPicture.asset("assets/screen15/icon/star15.svg"),
        Common.customText(
            text: "4.5 (52 reviews)",
            fontSize: 14,
            fontWeight: FontWeight.w400),
      ],
    );
  }

  Widget _imageSlider() {
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/screen15/icon/bg.png",
              fit: BoxFit.fitWidth,
            )),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: SvgPicture.asset("assets/screen15/icon/aero15.svg")),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: const Icon(Icons.heart_broken_outlined)),
        )
      ],
    );
  }
}
