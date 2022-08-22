import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_news/model/news_model.dart';
import 'package:get_news/utils/colors.dart';
import 'package:get_news/utils/textStyle.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({Key? key, required this.newsModel}) : super(key: key);
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.w),
        height: 100.h,
        width: 100.w,
        child: SafeArea(
          child: ListView(
            children: [
              // SizedBox(
              //   height: 5.h,
              // ),
              Container(
                // height: 8.h,
                width: 100.w,
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Container(
                        height: 5.h,
                        width: 5.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: black, width: 1)),
                        child: FaIcon(
                          FontAwesomeIcons.arrowLeft,
                          size: 2.h,
                          color: black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80.w,
                      child: Text(
                        newsModel.title!,
                        style: headingStyle,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 30.h,
                width: 100.w,
                child: Image(
                  image: NetworkImage(
                    newsModel.urlToImage!,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 4.h,
                width: 100.w,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 70.w,
                      child: Text(
                        'Author : ' + newsModel.author!,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(newsModel.url!),
                            mode: LaunchMode.externalApplication);
                      },
                      child: Container(
                        height: 3.h,
                        width: 23.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: lightGreen),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Visit',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: darkGreen,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            FaIcon(
                              FontAwesomeIcons.squareArrowUpRight,
                              size: 15,
                              color: darkGreen,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                width: 100.w,
                child: Text(
                  'Content : ',
                  textAlign: TextAlign.left,
                  style: subheadingStyle,
                ),
              ),
              Text(
                newsModel.content!,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                width: 100.w,
                child: Text(
                  'Description : ',
                  textAlign: TextAlign.left,
                  style: subheadingStyle,
                ),
              ),
              Text(
                newsModel.description!,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
