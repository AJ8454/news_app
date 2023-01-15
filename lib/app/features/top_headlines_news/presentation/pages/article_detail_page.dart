import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/app/features/top_headlines_news/data/models/top_headline_news_model.dart';
import 'package:news_app/global/common/common_utils.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article? article;
  const ArticleDetailPage({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leadingWidth: 65,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ClipOval(
            child: Material(
              color: Colors.black.withOpacity(0.3), // Button color
              child: SizedBox(
                width: 56,
                height: 56,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const SizedBox(
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          if (article!.urlToImage != null)
            CachedNetworkImage(
              height: double.infinity,
              imageUrl: article!.urlToImage!,
              fit: BoxFit.cover,
            ),
          if (article!.urlToImage != null)
            Positioned(
              bottom: -1,
              child: Container(
                width: 800,
                height: 800,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.black.withOpacity(0)],
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: CommonUtils.height(context)! * 0.34,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: CommonUtils.width(context)! * 0.9,
                child: Text(
                  article!.title!,
                  style: CommonUtils.themeTextStyle(
                    context,
                    fsize: CommonUtils.kmaxExtraLargeFont(context),
                    tColor: CommonUtils.kWhiteMColor,
                    fweight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: CommonUtils.height(context)! * 0.26,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              width: CommonUtils.width(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    article!.source!.name!,
                    style: CommonUtils.themeTextStyle(
                      context,
                      fsize: CommonUtils.kextraLargeFont(context),
                      tColor: CommonUtils.kWhiteMColor,
                      fweight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd').format(article!.publishedAt!),
                    style: CommonUtils.themeTextStyle(
                      context,
                      fsize: CommonUtils.kextraLargeFont(context),
                      tColor: CommonUtils.kWhiteMColor,
                      fweight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (article!.description != null)
            Positioned(
              bottom: CommonUtils.height(context)! * 0.12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                width: CommonUtils.width(context),
                child: Text(
                  article!.description!,
                  style: CommonUtils.themeTextStyle(
                    context,
                    fsize: CommonUtils.kmediumFont(context),
                    tColor: CommonUtils.kWhiteLColor,
                    fweight: FontWeight.w400,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
