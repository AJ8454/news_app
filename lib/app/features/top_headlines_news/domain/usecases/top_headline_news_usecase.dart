import 'package:news_app/app/features/top_headlines_news/data/models/top_headline_news_model.dart';
import 'package:news_app/app/features/top_headlines_news/domain/repository/top_headline_news_api_repository.dart';

class TopHeadlineNewsUseCase {
  final TopHeadlineNewsApiRepositoryInterface repository;
  TopHeadlineNewsUseCase({required this.repository});

  Future<List<Article?>?> call(int pageToken) async {
    return repository.getTopHeadlineNews(pageToken);
  }
}
