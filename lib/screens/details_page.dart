import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/res/my_colors.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              child: Image.asset("assets/images/BG.png"),
            ),
            Positioned(
              top: 20,
              left: 15,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(245, 245, 245, 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xff173418),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: size.height * 438 / 812,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(14),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 88,
                      bottom: 0,
                      left: 16,
                      right: 16,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: const [
                            Text(
                              "LONDON — Cryptocurrencies “have no intrinsic value” and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey said.Digital currencies like bitcoin, ether and even dogecoin have been on a tear this year, reminding some investors of the 2017 crypto bubble in which bitcoin blasted toward \$20,000, only to sink as low as \$3,122 a year later.Asked at a press conference Thursday about the rising value of cryptocurrencies, Bailey said: “They have no intrinsic value. That doesn’t mean to say people don’t put value on them, because they can have extrinsic value. But they have no intrinsic value.”“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”Bailey’s comments echoed a similar warning from the U.K.’s Financial Conduct Authority.“Investing in cryptoassets, or investments and lending linked to them, generally involves taking very high risks with investors’ money,” the financial services watchdog said in January.“If consumers invest in these types of product, they should be prepared to lose all their money.”Bailey, who was formerly the chief executive of the FCA, has long been a skeptic of crypto. In 2017, he warned: “If you want to invest in bitcoin, be prepared to lose all your money.”",
                              style: TextStyle(
                                fontFamily: "Nunito",
                                color: Color(0xff2E0505),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 48,
                      right: 15,
                      child: FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: AppColors.kPrimaryColor,
                        child: SvgPicture.asset(
                          "assets/icons/Fav.svg",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 275,
              left: 32,
              right: 32,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                height: 141,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(245, 245, 245, 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Sunday, 9 May 2021",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        color: Color(0xff2E0505),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Crypto investors should be prepared to lose all their money, BOE governor says",
                      style: TextStyle(
                        fontFamily: "NewYorkSmall",
                        color: Color(0xff2E0505),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Published by Ryan Browne",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        color: Color(0xff2E0505),
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
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
