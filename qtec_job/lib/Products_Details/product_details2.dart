import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCorj-Jr5FFB2CMBmv8h2SSTwkFQ7bpKmQgCXjtU5bkw6raD33F2OOsJ4O0UNKQlFST20&usqp=CAU',
];

class ProductsDEtailsPAge2 extends StatelessWidget {
  ProductsDEtailsPAge2({super.key});
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 241, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 228, 241, 255),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: Text(
          "প্রোডাক্ট ডিটেইল",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: search,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF5F5F5),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  labelText: 'কাঙ্ক্ষিত পণ্যটি খুঁজুন',
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.030,
              ),
              CarouselSlider.builder(
                itemCount: imgList.length,
                options: CarouselOptions(
                  // enableInfiniteScroll: true,
                  // autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  initialPage: 0,
                  autoPlay: true,
                  aspectRatio: 16 / 10,
                  viewportFraction: 1.0,
                ),
                itemBuilder: (context, index, realIdx) {
                  return Container(
                    // height: size.height * 0.50,
                    // width: size.width,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(imgList[index].toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.030,
              ),
              Text(
                "প্রিঞ্জেলস অনিওন চিপস ৪২ গ্রাম",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.010,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "ব্রান্ডঃ" + " প্রিঞ্জেলস",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red),
                  ),
                  Text(
                    "ডিস্ট্রিবিউটরঃ মোঃ মোবারাক হোসেন",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.010,
              ),
              Container(
                height: size.height * 0.15,
                width: size.width * 0.95,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ক্রয়মূল্যঃ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "৳ 220",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "বিক্রয়মূল্যঃ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                          Center(
                            child: Image(
                              image: AssetImage("images/sell3.png"),
                              height: 50,
                              width: 100,
                            ),
                          ),
                          Text(
                            "৳ 250",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    Image(image: AssetImage("images/line.png")),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "লাভঃ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "৳ 30",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "বিস্তারিত",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.20,
                  ),
                  Center(
                    child: Image(
                      image: AssetImage("images/sell2.png"),
                      height: 70,
                      width: 70,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.010,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "জীবের মধ্যে সবচেয়ে সম্পূর্ণতা মানুষের। কিন্তু সবচেয়ে অসম্পূর্ণ হয়ে সে জন্মগ্রহণ করে। বাঘ ভালুক তার জীবনযাত্রার পনেরো- আনা মূলধন নিয়ে আসে প্রকৃতির মালখানা থেকে। জীবরঙ্গভূমিতে মানুষ এসে দেখা দেয় দুই শূন্য হাতে মুঠো বেঁধে।",
                  style: TextStyle(
                      color: Color.fromARGB(255, 123, 119, 119),
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
