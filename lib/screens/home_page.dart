import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../res/my_colors.dart';
import '../res/my_strings.dart';
import 'details_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<String> info = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 15 / 375,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      width: 290,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.kMyGrey),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: AppStrings.kSearchBarHintText,
                          hintStyle: const TextStyle(
                            color: Color(0xff818181),
                            fontFamily: "Nunito",
                          ),
                          fillColor: Colors.transparent,
                          suffix:
                              // Icon(Icons.search),
                              SvgPicture.asset(
                            "assets/icons/SearchIcon.svg",
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.all(5),
                        height: 32,
                        width: 33,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.kPrimaryColor,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Notification.svg",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 72,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Latest News",
                    style: TextStyle(
                      fontFamily: "NewYorkSmall",
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: const [
                        Text(
                          "See All",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            color: Color(0xff0080FF),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Color(0xff0080FF),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 109,
              left: 16,
              right: 16,
              bottom: 0,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    for (int i = 0; i < info.length; i++)
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DetailsPage()));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            bottom: 15,
                          ),
                          width: double.infinity,
                          height: size.height * 240 / 812,
                          decoration: BoxDecoration(
                              // image: DecorationImage(
                              //     image: AssetImage(
                              //   "assets/images/BG.png",
                              // ),),
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(123, 232, 232, 232)),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 0,
                                left: 0,
                                top: 0,
                                bottom: 0,
                                child: Image.asset(
                                  "assets/images/BG.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                top: 80,
                                left: 16,
                                right: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "by Ryan Browne",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Crypto investors should be prepared to lose all their money, BOE governor says",
                                      style: TextStyle(
                                        fontFamily: "NewYorkSmall",
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 16,
                                left: 16,
                                right: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
