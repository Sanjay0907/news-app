import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_news/controller/provider/news_provider.dart';
import 'package:get_news/model/news_model.dart';
import 'package:get_news/utils/colors.dart';
import 'package:get_news/utils/textStyle.dart';
import 'package:get_news/view/news_details_page/news_details_page.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyShade200,
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
              Container(
                height: 6.h,
                width: 100.w,
                alignment: Alignment.bottomCenter,
                child: Text(
                  'News Today',
                  style: headingStyle,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: Consumer<NewsProvider>(
                  builder: (context, newsProvider, child) {
                    if (newsProvider.isLoading == true) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: white,
                            highlightColor: lightGreen,
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 1.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: white,
                              ),
                              height: 30.h,
                              width: 100.w,
                            ),
                          );
                        },
                      );
                    } else {
                      if (newsProvider.products.isNotEmpty) {
                        return ListView.builder(
                            itemCount: newsProvider.products.length,
                            itemBuilder: (context, index) {
                              NewsModel currentNewsModel =
                                  newsProvider.products[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NewsDetailsPage(
                                        newsModel: currentNewsModel,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.w, vertical: 0.5.h),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 3.w, vertical: 0.7.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: white,
                                  ),
                                  height: 30.h,
                                  width: 100.w,
                                  child: Column(children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      height: 20.h,
                                      width: 100.w,
                                      child: Image(
                                        image: NetworkImage(
                                            currentNewsModel.urlToImage!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 8.h,
                                      width: 100.w,
                                      child: Text(
                                        currentNewsModel.title!,
                                        maxLines: 2,
                                        textAlign: TextAlign.left,
                                        style: bannerTitleStyle,
                                      ),
                                    )
                                  ]),
                                ),
                              );
                            });
                      } else {
                        return const Center(
                          child: Text('No News Found'),
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
