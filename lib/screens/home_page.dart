import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/Data/Cubits/AllNewsCubit/all_news_cubit.dart';
import 'package:news_app/Data/Models/all_news/all_news.dart';

import '../res/my_colors.dart';
import '../res/my_strings.dart';
import 'details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 130,
              left: 16,
              right: 16,
              bottom: 0,
              child: BlocBuilder<AllNewsCubit, AllNewsState>(
                builder: (context, state) {
                  if (state is AllNewsInitial) {
                    return Positioned(
                        top: size.height / 2,
                        left: size.width / 3,
                        child: const Center(
                          child: Text("press to get news"),
                        ));
                  } else if (state is AllNewsLoading) {
                    return Positioned(
                        top: size.height / 2,
                        left: size.width / 2,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ));
                  } else if (state is AllNewsSuccess) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.ourResponse.articles!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                          articleContent: state
                                                      .ourResponse
                                                      .articles![index]
                                                      .content ==
                                                  null
                                              ? ""
                                              : state.ourResponse
                                                  .articles![index].content!,
                                          articleImage: state
                                                      .ourResponse
                                                      .articles![index]
                                                      .urlToImage ==
                                                  null
                                              ? "https://th.bing.com/th/id/OIP.eqAifC8QFEN9ccPaVVNNsQHaEK?pid=ImgDet&rs=1"
                                              : state.ourResponse
                                                  .articles![index].urlToImage!,
                                          articleAuthor: state.ourResponse.articles![index]
                                                    .author ==
                                                null
                                            ? ''
                                            : "Published by: ${state.ourResponse.articles![index].author}",
                                          articlePublishDate: state
                                                      .ourResponse
                                                      .articles![index]
                                                      .publishedAt ==
                                                  null
                                              ? ""
                                              : state.ourResponse
                                                  .articles![index].publishedAt!,
                                        )));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 15,
                            ),
                            width: double.infinity,
                            height: size.height * 240 / 812,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color:
                                    const Color.fromARGB(123, 232, 232, 232)),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    state.ourResponse.articles![index]
                                                .urlToImage ==
                                            null
                                        ? "https://th.bing.com/th/id/OIP.eqAifC8QFEN9ccPaVVNNsQHaEK?pid=ImgDet&rs=1"
                                        : state.ourResponse.articles![index]
                                            .urlToImage!,
                                    width: double.infinity,
                                    height: size.height * 240 / 812,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 80,
                                  left: 16,
                                  right: 16,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.ourResponse.articles![index]
                                                    .author ==
                                                null
                                            ? ''
                                            : "By: ${state.ourResponse.articles![index].author}",
                                        style: const TextStyle(
                                          fontFamily: "Nunito",
                                          backgroundColor:
                                              Color.fromARGB(113, 0, 0, 0),
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        state.ourResponse.articles![index]
                                                .title ??
                                            '',
                                        style: const TextStyle(
                                          fontFamily: "NewYorkSmall",
                                          backgroundColor:
                                              Color.fromARGB(113, 0, 0, 0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.ourResponse.articles![index]
                                                .description ??
                                            '',
                                        style: const TextStyle(
                                          fontFamily: "Nunito",
                                          backgroundColor:
                                              Color.fromARGB(113, 0, 0, 0),
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
                        );
                      },
                    );
                  } else {
                    return Positioned(
                        top: size.height / 2,
                        left: size.width / 3,
                        child: const Center(
                          child: Text("Error"),
                        ));
                  }
                },
              ),
            ),
            Positioned(
              top: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 15 / 375,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 290,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide:
                                      BorderSide(color: AppColors.kMyGrey)),
                              hintText: AppStrings.kSearchBarHintText,
                              hintStyle: const TextStyle(
                                color: Color(0xff818181),
                                fontFamily: "Nunito",
                                fontSize: 12,
                              ),
                              fillColor: Colors.transparent,
                              suffixIcon: const Icon(Icons.search),
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
                  ],
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: size.width / 3,
              child: ElevatedButton(
                onPressed: () {
                  context.read<AllNewsCubit>().getAllNews();
                },
                child: const Text("Refresh"),
              ),
            ),
            Positioned(
              top: 105,
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
          ],
        ),
      ),
    );
  }
}
