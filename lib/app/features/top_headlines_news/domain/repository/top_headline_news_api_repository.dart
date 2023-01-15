import 'package:news_app/app/features/top_headlines_news/data/models/top_headline_news_model.dart';

abstract class TopHeadlineNewsApiRepositoryInterface {
  Future<List<Article?>?> getTopHeadlineNews(int pageToken);
}
