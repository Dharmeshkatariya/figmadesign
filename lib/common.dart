import 'package:carousel_slider/carousel_slider.dart';
import 'package:figmadesign/model/Statesdata.dart';
import 'package:figmadesign/model/aboutview.dart';
import 'package:figmadesign/model/artdata.dart';
import 'package:figmadesign/model/bestfood.dart';
import 'package:figmadesign/model/bunglahouse.dart';
import 'package:figmadesign/model/cardata.dart';
import 'package:figmadesign/model/clothshopping_data.dart';
import 'package:figmadesign/model/contactdata.dart';
import 'package:figmadesign/model/foododer.dart';
import 'package:figmadesign/model/grillchicken.dart';
import 'package:figmadesign/model/homedata.dart';
import 'package:figmadesign/model/lapinozdata.dart';
import 'package:figmadesign/model/mcdonalditem.dart';
import 'package:figmadesign/model/meals-data.dart';
import 'package:figmadesign/model/monthdata.dart';
import 'package:figmadesign/model/reviewdata.dart';
import 'package:figmadesign/model/shopdata.dart';
import 'package:figmadesign/model/userdata.dart';
import 'package:figmadesign/model/vegatable.dart';
import 'package:flutter/material.dart';

class Common {
  static Widget customText(
      {String? text, double? fontSize, FontWeight? fontWeight, Color? color}) {
    return Text(text!,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ));
  }

  static Widget navigatePage({String? text, GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text!,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  static Widget containerButton({
    Color? color,
    BorderRadiusGeometry? borderRadius,
    Widget? child,
  }) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }

  static Widget imageSlider({item}) {
    CarouselController buttonCarouselController = CarouselController();
    return CarouselSlider(
      items: [
        item,
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

  static Widget customContainer(
      {Color? color,
      BorderRadiusGeometry? borderRadius,
      Widget? child,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding}) {
    return Container(
      alignment: Alignment.center,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }

  static Widget textField(
      {TextEditingController? controller,
      String? text,
      String? text1,
      Widget? prefixIcon,
      Widget? suffixIcon,
      Color? fillColor,
      TextStyle? labelStyle,
      TextInputType? keyboardType}) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        labelText: text1,
        labelStyle: labelStyle,
        fillColor: fillColor,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  List<UserData> getData() {
    List<UserData> userList = [];

    var image = [
      "assets/screen2/icon/image.png",
      "assets/screen2/icon/image.png"
    ];
    var svg1Image = [
      "assets/screen2/icon/s1.svg",
      "assets/screen2/icon/s1.svg",
    ];
    var sImage = [
      "assets/screen2/icon/food.svg",
      "assets/screen2/icon/food.svg",
    ];
    var tittle = ["Today", "Yesterday"];
    var userName = ["Sarah", 'lara'];
    var shopName = ["Shopping", 'Shopping'];
    var foodName = ["Food Delivery", 'Food Delivery'];

    for (int i = 0; i < image.length; i++) {
      UserData userData = UserData();
      userData.image = image[i];
      userData.tittle = tittle[i];
      userData.userName = userName[i];
      userData.shopName = shopName[i];
      userData.foodName = foodName[i];
      userData.svg1Image = svg1Image[i];
      userData.sImage = sImage[i];
      userList.add(userData);
    }
    return userList;
  }

  List<User> setData() {
    List<User> uList = [];
    var name = ["Edwardo", "Jasson", "Kemod", "Dasep"];
    var eName = ["E", "J", "K", "D"];
    var userImage = [
      "assets/screen3/icon/image1.png",
      "assets/screen3/icon/image2.png",
      "assets/screen3/icon/i3.png",
      "assets/screen3/icon/i4.png",
    ];
    var mobile = [62898023450, 62898023450, 62898023450, 62898023450];
    for (int i = 0; i < name.length; i++) {
      User user = User();
      user.name = name[i];
      user.mobile = mobile[i];
      user.image = userImage[i];
      user.eName = eName[i];
      uList.add(user);
    }
    return uList;
  }

  List<Car> carData() {
    List<Car> cList = [];
    var cname = [
      "Gotham Car Reparation",
      "Gotham Car",
      "Gotham auto moto",
      "Gotham Car"
    ];
    var cImage = [
      "assets/screen4/icon/car.png",
      "assets/screen4/icon/auto.png",
      "assets/screen4/icon/auto.png",
      "assets/screen4/icon/car.png",
    ];
    var cTime = ["8am-5am", "8am-5am", "8am-5am", "8am-5am"];
    var cAddress = ["surat", "surat", "valsad", "Bardoli"];

    for (int i = 0; i < cname.length; i++) {
      Car car = Car();
      car.name = cname[i];
      car.image = cImage[i];
      car.time = cTime[i];
      car.address = cAddress[i];
      cList.add(car);
    }
    return cList;
  }

  List<Art> artData() {
    List<Art> arList = [];
    var artName = ["Art", "Couture", 'Collator', "Celebrate"];

    for (int i = 0; i < artName.length; i++) {
      Art art = Art();
      art.artName = artName[i];
      art.selected = true;
      arList.add(art);
    }
    return arList;
  }

  List<Vegatable> vegatableData() {
    List<Vegatable> vegList = [];
    var vegImage = [
      "assets/screen6/icon/veg1.svg",
      "assets/screen6/icon/heart.svg",
    ];
    var vegName = ["Point vert", "Vert"];

    for (int i = 0; i < vegName.length; i++) {
      Vegatable vegatable = Vegatable();
      vegatable.vegName = vegName[i];
      vegatable.vegImage = vegImage[i];
      vegList.add(vegatable);
    }
    return vegList;
  }

  List<Review> reviewData() {
    List<Review> reviewList = [];

    var image = [
      "assets/screen7/icon/g.png",
      "assets/screen7/icon/g1.png",
      "assets/screen7/icon/g.png",
      "assets/screen7/icon/g1.png"
    ];
    var name = ["Sharon Jem", "Amy Gary", "Sharon Gary", "Amy Jem"];
    var time = ["1d ago", "2d ago", "5d ago", "10d ago"];
    var desc = [
      "Had such an amazing session with Maria. She instantly picked up on the level of my fitness and adjusted the workout to suit me whilst also pushing me to my limits.",
      "Maria has been amazing! 💪 Joining his coaching has been transformational for me and she makes it so much fun to workout with her I ve had several personal training experiences and this one is by far the best. Maria may very well be the best personal trainer in this app 😉",
      "Maria has been amazing! 💪 Joining his coaching has been transformational for me and she makes it so much fun to workout with her I ve had several personal training experiences and this one is by far the best. Maria may very well be the best personal trainer in this app 😉",
      "Had such an amazing session with Maria. She instantly picked up on the level of my fitness and adjusted the workout to suit me whilst also pushing me to my limits."
    ];
    for (int i = 0; i < image.length; i++) {
      Review review = Review();
      review.uName = name[i];
      review.uImage = image[i];
      review.discrption = desc[i];
      review.uTime = time[i];

      reviewList.add(review);
    }

    return reviewList;
  }

  List<Month> monthData() {
    List<Month> monthList = [];
    var name = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "June",
      "July",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    for (int i = 0; i < name.length; i++) {
      Month month = Month();
      month.name = name[i];

      monthList.add(month);
    }
    return monthList;
  }

  List<Month> weeklyData() {
    List<Month> mList = [];
    var tittle = [
      "monday 3, jan",
      "tuesday 4,jan",
      "wed 5 ,jan",
      "Thursday 6 ,jan "
    ];
    var image = [
      "assets/screen8/icon/morning.png",
      "assets/screen8/icon/af.png",
      "assets/screen8/icon/morning.png",
      "assets/screen8/icon/af.png",
    ];
    var day = ["Morning", "Afternoon", "Evening", "Night"];

    for (int i = 0; i < tittle.length; i++) {
      Month month = Month();
      month.tittle = tittle[i];
      month.day = day[i];
      month.image = image[i];
      mList.add(month);
    }
    return mList;
  }

  List<Shop> gShopData() {
    List<Shop> shopList = [];

    var fImage = [
      "assets/screen9/icon/stoberry.png",
      "assets/screen9/icon/milk.png",
      "assets/screen9/icon/cola.png",
      "assets/screen9/icon/soda.png",
    ];
    var fName = [
      "Strawberry \nmargarita",
      "Strawberry \nmilkshake",
      "Cocktails",
      "Hard \nsoda"
    ];
    for (int i = 0; i < fName.length; i++) {
      Shop shop = Shop();
      shop.fName = fName[i];
      shop.fImage = fImage[i];
      shopList.add(shop);
    }

    return shopList;
  }

  List<Meals> mealsData() {
    List<Meals> mealList = [];
    var mName = [
      "Jollof Rice",
      "Peppered Snail",
      "Rice milkshake",
      "Jira Rice"
    ];
    var mImage = [
      "assets/screen9/icon/rice.png",
      "assets/screen9/icon/snake.png",
      "assets/screen9/icon/jirarice.png",
      "assets/screen9/icon/s.png",
    ];
    var mPrice = [2000, 2500, 1500, 2400];

    for (int i = 0; i < mName.length; i++) {
      Meals meals = Meals();
      meals.mName = mName[i];
      meals.mImage = mImage[i];
      meals.mPrice = mPrice[i];
      mealList.add(meals);
    }
    return mealList;
  }

  List<McdonaldPage> mcdonaldData() {
    List<McdonaldPage> mList = [];
    var tittle = [
      "What’s your mood today?",
      "Popular moods you can get",
    ];
    for (int i = 0; i < tittle.length; i++) {
      McdonaldPage mcdonaldPage = McdonaldPage();
      mcdonaldPage.tittle = tittle[i];
      mList.add(mcdonaldPage);
    }
    return mList;
  }

  List<McdonaldItem> mcdonalItem() {
    List<McdonaldItem> aList = [];
    var name = [
      "Snacks",
      "Pizza",
      "Biryani",
    ];
    var image = [
      "assets/screen10/icon/snack10.png",
      "assets/screen10/icon/pizza.png",
      "assets/screen10/icon/biryani.png",
    ];

    for (int i = 0; i < name.length; i++) {
      McdonaldItem mcdonaldItem = McdonaldItem();
      mcdonaldItem.name = name[i];
      mcdonaldItem.image = image[i];
      aList.add(mcdonaldItem);
    }
    return aList;
  }

  List<FoodItem> fastFood() {
    List<FoodItem> fList = [];
    var name = ["Pav Bhaji", "Loaded Pizza", "Veg Fix Thali"];
    var image = [
      "assets/screen10/icon/pavbhaji.png",
      "assets/screen10/icon/lapinio.png",
      "assets/screen10/icon/maruti.png",
    ];
    var foodType = [
      "North Indian, Snacks",
      "Pizza, Fast food",
      "Pizza, Fast food"
    ];
    var shopName = ["Das Kitchen", "La Pino’z Pizza", "Shree Marutinandan"];
    var time = ["40min", "25min", "15min"];
    var distance = [2, 4, 5];
    var price = [100, 175, 100];

    for (int i = 0; i < name.length; i++) {
      FoodItem foodItem = FoodItem();
      foodItem.name = name[i];
      foodItem.image = image[i];
      foodItem.foodType = foodType[i];
      foodItem.shopName = shopName[i];
      foodItem.time = time[i];
      foodItem.distance = distance[i];
      foodItem.price = price[i];
      fList.add(foodItem);
    }
    return fList;
  }

  List<BestFood> bestFoodData() {
    List<BestFood> bList = [];
    var name = [
      "Grill Chicken",
      "Grill Chicken",
      "Grill Chicken",
      "Grill Chicken",
    ];
    var image = [
      "assets/screen11/icon/grill.png",
      "assets/screen11/icon/grill.png",
      "assets/screen11/icon/grill.png",
      "assets/screen11/icon/grill.png",
    ];
    var itemName = ["Salad", "Pizza", "Drink", "Icecream"];
    var price = [10, 10, 10, 10];

    for (int i = 0; i < name.length; i++) {
      BestFood bestFood = BestFood();

      bestFood.name = name[i];
      bestFood.image = image[i];
      bestFood.itemName = itemName[i];
      bestFood.price = price[i];
      bList.add(bestFood);
    }
    return bList;
  }

  List<GrillData> grillChickenData() {
    List<GrillData> gLIst = [];

    var name = [
      "Grill chicken",
      "Grill chicken",
      "Grill chicken",
    ];
    var image = [
      "assets/screen11/icon/grill.png",
      "assets/screen11/icon/grill.png",
      "assets/screen11/icon/grill.png",
    ];
    var time = ["25min", "20min", "10min"];
    var price = [36, 25, 35];

    for (int i = 0; i < name.length; i++) {
      GrillData grillData = GrillData();
      grillData.name = name[i];
      grillData.time = time[i];
      grillData.image = image[i];
      grillData.price = price[i];
      gLIst.add(grillData);
    }
    return gLIst;
  }

  List<AboutView> aboutProfileData() {
    List<AboutView> aboutList = [];
    var tittle = [
      "About me",
      "Work experience",
      "Education",
      "Skill",
      "language",
      "Apprection",
      "Resume"
    ];
    var icon = [
      "assets/screen12/icon/about.svg",
      "assets/screen12/icon/worke.svg",
      "assets/screen12/icon/educat.svg",
      "assets/screen12/icon/skill.svg",
      "assets/screen12/icon/lang.svg",
      "assets/screen12/icon/lang.svg",
      "assets/screen12/icon/resume.svg",
    ];
    var suffixIcon = [
      "assets/screen12/icon/ballpen.svg",
      "assets/screen12/icon/Add.svg",
      "assets/screen12/icon/Add.svg",
      "assets/screen12/icon/ballpen.svg",
      "assets/screen12/icon/ballpen.svg",
      "assets/screen12/icon/ballpen.svg",
      "assets/screen12/icon/Add.svg",
    ];

    var disc = [
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor",
      "Manager \nAmazon Inc \nJan 2015 - Feb 2022",
      "Information Technology \nUniversity of Oxford \nSep 2010 - Aug 2013 ",
      "Leadership \nTeamwork\nVisioner",
      "English \nGerman\nSpanish",
      "Wireless Symposium (RWS) \nYoung Scientist\n2014",
      "Jamet kudasi - CV - UI/UX Designer"
    ];

    for (int i = 0; i < icon.length; i++) {
      AboutView aboutView = AboutView();

      aboutView.tittle = tittle[i];
      aboutView.icon = icon[i];
      aboutView.suffixIcon = suffixIcon[i];
      aboutView.discription = disc[i];
      aboutView.isSelected = false;
      aboutList.add(aboutView);
    }

    return aboutList;
  }

  List<HouseData> homeDetail() {
    List<HouseData> homeList = [];

    var name = ["All", "House", "Apartment", "House"];
    var location = ["surat", "rajkot", "Delhi", "Jakarta"];
    var cityImage = [
      "assets/screen13/icon/c1.png",
      "assets/screen13/icon/c2.png",
      "assets/screen13/icon/c2.png",
      "assets/screen13/icon/c1.png",
    ];
    var person = [
      "Amanda",
      "Aman",
      "jenny",
      "jems",
    ];
    var pImage = [
      "assets/screen13/icon/person1.png",
      "assets/screen13/icon/person2.png",
      "assets/screen13/icon/person3.png",
      "assets/screen13/icon/person4.png",
    ];
    for (int i = 0; i < name.length; i++) {
      HouseData houseData = HouseData();
      houseData.name = name[i];
      houseData.person = person[i];
      houseData.cityImage = cityImage[i];
      houseData.location = location[i];
      houseData.pImage = pImage[i];
      homeList.add(houseData);
    }
    return homeList;
  }

  List<Estates> apartmentData() {
    List<Estates> homeList = [];
    var name = ["apartment", "villa", "apartment", "villa"];
    var image = [
      "assets/screen13/icon/home2.png",
      "assets/screen13/icon/home1.png",
      "assets/screen13/icon/home3.png",
      "assets/screen13/icon/home4.png",
    ];
    var apartment = [
      "Sky Dandelions \nApartment",
      "Sky Dandelions \nApartment",
      "Sky Dandelions \nApartment",
      "Sky Dandelions \nApartment",
    ];
    var location = [
      "Jakarta, Indonesia",
      "Jakarta, Indonesia",
      "Jakarta, Indonesia",
      "Jakarta, Indonesia",
    ];
    var rate = [
      290,
      290,
      290,
      290,
    ];
    for (int i = 0; i < name.length; i++) {
      Estates estates = Estates();
      estates.name = name[i];
      estates.image = image[i];
      estates.apartment = apartment[i];
      estates.location = location[i];
      estates.rate = rate[i];
      homeList.add(estates);
    }
    return homeList;
  }

  List<BunglaHouse> bunglaData() {
    List<BunglaHouse> hList = [];
    var name = [
      "Wings Tower",
      "Mill Sper House",
      "Bungalow House",
      "Sky Dandelions Apartment"
    ];
    var image = [
      "assets/screen13/icon/home1.png",
      "assets/screen13/icon/home3.png",
      "assets/screen13/icon/home4.png",
      "assets/screen13/icon/home5.png",
    ];

    var location = [
      "Jakarta, Indonesia",
      "Jakarta, Indonesia",
      "Jakarta, Indonesia",
      "Jakarta, Indonesia",
    ];
    var rate = [
      2900,
      2900,
      2800,
      2000,
    ];

    for (int i = 0; i < name.length; i++) {
      BunglaHouse bunglaHouse = BunglaHouse();
      bunglaHouse.name = name[i];
      bunglaHouse.image = image[i];
      bunglaHouse.location = location[i];
      bunglaHouse.rate = rate[i];
      hList.add(bunglaHouse);
    }

    return hList;
  }

  List<BoysFashion> fashionData() {
    List<BoysFashion> fList = [];
    var dressName = [
      "Dress",
      "Shirt",
      "Pants",
      "t-Shirt",
    ];
    var dressImage = [
      "assets/screen14/icon/dress.png",
      "assets/screen14/icon/tshirt.png",
      "assets/screen14/icon/pant.png",
      "assets/screen14/icon/tshirt.png",
    ];
    var typeName = [
      "Long Sleeve \nShirts",
      "Long Sleeve \nShirts",
      "Long Sleeve \nShirts",
      "Long Sleeve \nShirts",
    ];
    var boysImage = [
      "assets/screen14/icon/boy1.png",
      "assets/screen14/icon/boy2.png",
      "assets/screen14/icon/boy1.png",
      "assets/screen14/icon/boy2.png",
    ];
    var price = [290, 220, 450, 550];

    for (int i = 0; i < boysImage.length; i++) {
      BoysFashion boysFashion = BoysFashion();
      boysFashion.dressImage = dressImage[i];
      boysFashion.dressName = dressName[i];
      boysFashion.boysImage = boysImage[i];
      boysFashion.typeName = typeName[i];
      boysFashion.price = price[i];
      fList.add(boysFashion);
    }

    return fList;
  }
}
