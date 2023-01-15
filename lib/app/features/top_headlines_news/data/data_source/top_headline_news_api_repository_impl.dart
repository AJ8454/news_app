import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:news_app/app/features/top_headlines_news/data/models/top_headline_news_model.dart';
import 'package:news_app/app/features/top_headlines_news/domain/repository/top_headline_news_api_repository.dart';
import 'package:news_app/core/core.dart';
import 'package:news_app/core/custom_exception.dart';
import 'package:news_app/global/providers/provoder.dart';

class TopHeadlineNewsApiRepositoryImpl
    implements TopHeadlineNewsApiRepositoryInterface {
  final http.Client httpClient;
  TopHeadlineNewsApiRepositoryImpl({required this.httpClient});

  @override
  Future<List<Article?>?> getTopHeadlineNews(int pageToken) async {
    const String mainendPoint = "top-headlines";
    log("$pageToken");
    Map<String, dynamic>? queryParameters = {
      "country": "in",
      "apiKey": accesskey,
      "pageSize": "5",
      "page": "$pageToken"
    };

    final uri = Uri.https(baseURL, endPoint(mainendPoint), queryParameters);
    final response = await httpClient.get(uri, headers: headerBearerOption());

    if (response.statusCode == 200) {
      TopHeadlineNewsModel? topHeadlineNewsModel =
          TopHeadlineNewsModel.fromJson(json.decode(response.body));
      return topHeadlineNewsModel.articles!;
    } else {
      throw ServerException(message: "Top Headline News Server Exception");
    }
  }
}
