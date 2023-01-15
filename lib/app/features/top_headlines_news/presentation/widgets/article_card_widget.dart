import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/app/app_constant/page_const.dart';
import 'package:news_app/app/features/top_headlines_news/data/models/top_headline_news_model.dart';
import 'package:news_app/app/features/top_headlines_news/presentation/cubit/top_headlines_new_cubit.dart';

import 'package:news_app/global/common/common_utils.dart';

class ArticleCardWidget extends StatefulWidget {
  const ArticleCardWidget({Key? key, required this.allArticles})
      : super(key: key);

  final List<Article?>? allArticles;

  @override
  State<ArticleCardWidget> createState() => _ArticleCardWidgetState();
}

class _ArticleCardWidgetState extends State<ArticleCardWidget> {
  final scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    setupScrollController();
    super.initState();
  }

  void setupScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        isLoading = true;
        BlocProvider.of<TopHeadlinesNewCubit>(context).getTopHeadlineArticles();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      padding: EdgeInsets.all(CommonUtils.dSize(context)! * 16),
      separatorBuilder: (context, index) =>
          SizedBox(height: CommonUtils.dSize(context)! * 12),
      itemCount: widget.allArticles!.length + (isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < widget.allArticles!.length) {
          final article = widget.allArticles![index];
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(CommonUtils.kBorderRadius)),
            elevation: 10,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, PageConst.detailArticlePage,
                    arguments: article);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(CommonUtils.kBorderRadius),
                child: Stack(
                  children: [
                    article!.urlToImage != null
                        ? CachedNetworkImage(
                            imageUrl: article.urlToImage!,
                            fit: BoxFit.cover,
                            height: CommonUtils.height(context)! * 0.3,
                            width: double.infinity,
                            errorWidget: (context, url, error) => errorImage())
                        : errorImage(),
                    Positioned(
                      bottom: -1,
                      child: Container(
                        width: 800,
                        height: 300,
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
                      bottom: 50,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          article.title!,
                          maxLines: 3,
                          style: CommonUtils.themeTextStyle(
                            context,
                            fsize: CommonUtils.klargeFont(context),
                            tColor: CommonUtils.kWhiteMColor,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Text(
                              article.source!.name!,
                              maxLines: 2,
                              style: CommonUtils.themeTextStyle(
                                context,
                                fsize: CommonUtils.kminiFont(context),
                                tColor: CommonUtils.kWhiteMColor,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              DateFormat('yyyy-MM-dd')
                                  .format(article.publishedAt!),
                              maxLines: 2,
                              style: CommonUtils.themeTextStyle(
                                context,
                                fsize: CommonUtils.kminiFont(context),
                                tColor: CommonUtils.kWhiteMColor,
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
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget errorImage() => SizedBox(
        height: CommonUtils.height(context)! * 0.3,
        child: const Center(
          child: Icon(Icons.image),
        ),
      );
}
