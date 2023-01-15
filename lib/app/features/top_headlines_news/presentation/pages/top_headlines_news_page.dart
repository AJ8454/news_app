import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/app_constant/string_constant.dart';
import 'package:news_app/app/features/top_headlines_news/presentation/cubit/top_headlines_new_cubit.dart';
import 'package:news_app/app/features/top_headlines_news/presentation/widgets/article_card_widget.dart';
import 'package:news_app/global/common/common_utils.dart';

import '../../data/models/top_headline_news_model.dart';

class TopHeadLinesPage extends StatefulWidget {
  const TopHeadLinesPage({super.key});

  @override
  State<TopHeadLinesPage> createState() => _TopHeadLinesPageState();
}

class _TopHeadLinesPageState extends State<TopHeadLinesPage> {
  @override
  void initState() {
    BlocProvider.of<TopHeadlinesNewCubit>(context).getTopHeadlineArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CommonUtils.kBlackColor,
        centerTitle: true,
        title: Text(
          StringConst.headline,
          style: CommonUtils.themeTextStyle(
            context,
            fsize: CommonUtils.kmaxExtraLargeFont(context),
            letterSpacing: 2.5,
            fweight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<TopHeadlinesNewCubit, TopHeadlinesNewState>(
        builder: (context, state) {
          if (state is TopHeadlinesNewLoading && state.isFirstFetch) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TopHeadlinesNewFailure) {
            return Center(
              child: Text(
                state.errorMssg!,
                style: CommonUtils.themeTextStyle(context),
              ),
            );
          }

          List<Article?>? allArticles = [];

          if (state is TopHeadlinesNewLoading) {
            allArticles = state.oldArticles!;
          } else if (state is TopHeadlinesNewLoaded) {
            allArticles = state.articles;
          }

          return ArticleCardWidget(allArticles: allArticles);
        },
      ),
    );
  }
}
