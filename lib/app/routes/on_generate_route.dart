import 'package:flutter/material.dart';
import 'package:news_app/app/app_constant/page_const.dart';
import 'package:news_app/app/features/top_headlines_news/data/models/top_headline_news_model.dart';
import 'package:news_app/app/features/top_headlines_news/presentation/pages/article_detail_page.dart';
import 'package:news_app/app/features/top_headlines_news/presentation/pages/top_headlines_news_page.dart';
import 'package:news_app/app/splash/splash_screen.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return materialPageRoute(widget: const SplashScreen());
      case PageConst.topHeadlinePage:
        return materialPageRoute(widget: const TopHeadLinesPage());
      case PageConst.detailArticlePage:
        return materialPageRoute(
            widget: ArticleDetailPage(article: args as Article));
      default:
        return materialPageRoute(widget: const ErrorPage());
    }
  }
}

MaterialPageRoute materialPageRoute({required Widget widget}) =>
    MaterialPageRoute(builder: (_) => widget);

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("error"),
      ),
      body: const Center(
        child: Text("error"),
      ),
    );
  }
}
