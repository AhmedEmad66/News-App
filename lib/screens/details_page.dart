import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../res/my_colors.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.articleImage,
    required this.articleContent,
    required this.articlePublishDate,
    required this.articleAuthor,
  });

  final String articleImage;
  final String articleContent;
  final String articlePublishDate;
  final String articleAuthor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: size.height / 2,
              child: Image.network(
                articleImage,
                fit: BoxFit.cover,
              ),
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
                          children: [
                            Text(
                              articleContent,
                              style: const TextStyle(
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
              top: size.height * 275 / 812,
              left: size.width * 32 / 375,
              right: size.width * 32 / 375,
              child: SizedBox(
                height: size.height * 141 / 812,
                width: size.width * 311 / 375,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(245, 245, 245, 0.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            articlePublishDate,
                            style: const TextStyle(
                              fontFamily: "Nunito",
                              color: Color(0xff2E0505),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Crypto investors should be prepared to lose all their money, BOE governor says",
                            style: TextStyle(
                              fontFamily: "NewYorkSmall",
                              color: Color(0xff2E0505),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            articleAuthor,
                            style: const TextStyle(
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
