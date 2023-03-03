import 'package:figmadesign/common.dart';
import 'package:figmadesign/model/reviewdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  void initState() {
    // TODO: implement initState
    rList = Common().reviewData();
    super.initState();
  }

  List<Review> rList = [];
  bool isSelected = false;

  bool isCritical = false;
  bool isfav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          color: Colors.black,
          child: Column(
            children: [
              _reviewRow(),
              const SizedBox(height: 8),
              _recentRow(),
              const SizedBox(
                height: 14,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Common.customText(
                              text: "4.6",
                              fontWeight: FontWeight.w600,
                              fontSize: 48,
                              color: Colors.white),
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: rList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _listItem(index);
                          }),
                    ],
                  ),
                ),
              ),
              Common.customContainer(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(20),
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 60),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Common.customText(
                    text: "Write a Review",
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listItem(int index) {
    Review review = rList[index];

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: Colors.white30),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(review.uImage),
              const SizedBox(
                width: 10,
              ),
              Common.customText(
                  text: review.uName,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              const Spacer(),
              Common.customText(
                  text: review.uTime,
                  fontWeight: FontWeight.w400,
                  fontSize: 11,
                  color: Colors.white),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Common.customText(
              text: review.discrption,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ],
      ),
    );
  }

  Widget _recentRow() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            isSelected = !isSelected;
            setState(() {});
          },
          child: Common.customContainer(
            child: Common.customText(
                text: "Recent",
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w400),
            color: isSelected ? Colors.yellow : Colors.white30,
            borderRadius: BorderRadius.circular(12),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          ),
        ),
        GestureDetector(
          onTap: () {
            isCritical = !isCritical;
            setState(() {});
          },
          child: Common.customContainer(
            child: Common.customText(
                text: "Critical",
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w400),
            color: isCritical ? Colors.yellow : Colors.white30,
            borderRadius: BorderRadius.circular(12),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          ),
        ),
        GestureDetector(
          onTap: () {
            isfav = !isfav;
            setState(() {});
          },
          child: Common.customContainer(
            child: Common.customText(
                text: "Favourable",
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w400),
            color: isfav ? Colors.yellow : Colors.white30,
            borderRadius: BorderRadius.circular(12),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          ),
        ),
      ],
    );
  }

  Widget _reviewRow() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: const BoxDecoration(
                color: Colors.white30, shape: BoxShape.circle),
            child: SvgPicture.asset("assets/screen7/icon/b1.svg"),
          ),
        ),
        const SizedBox(
          width: 80,
        ),
        Common.customText(
            text: "REVIEW",
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.white)
      ],
    );
  }
}
