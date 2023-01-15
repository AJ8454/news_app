import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/app/features/top_headlines_news/data/models/top_headline_news_model.dart';
import 'package:news_app/app/features/top_headlines_news/domain/usecases/top_headline_news_usecase.dart';
import 'package:news_app/core/custom_exception.dart';

part 'top_headlines_new_state.dart';

class TopHeadlinesNewCubit extends Cubit<TopHeadlinesNewState> {
  final TopHeadlineNewsUseCase topHeadlineNewsUseCase;
  TopHeadlinesNewCubit({required this.topHeadlineNewsUseCase})
      : super(TopHeadlinesNewInitial());

  int pageToken = 1;

  Future<void> getTopHeadlineArticles() async {
    try {
      if (state is TopHeadlinesNewLoading) return;

      List<Article?>? oldArticles = [];

      final currentState = state;
      if (currentState is TopHeadlinesNewLoaded) {
        oldArticles = currentState.articles!;
      }

      emit(TopHeadlinesNewLoading(oldArticles, isFirstFetch: pageToken == 0));
      topHeadlineNewsUseCase.call(pageToken).then((newArticles) {
        pageToken++;

        final article = (state as TopHeadlinesNewLoading).oldArticles;
        article!.addAll(newArticles!);
        emit(TopHeadlinesNewLoaded(articles: article));
      });
    } on SocketException catch (e) {
      emit(TopHeadlinesNewFailure(errorMssg: e.message));
    } on ServerException catch (e) {
      emit(TopHeadlinesNewFailure(errorMssg: e.message));
    }
  }
}
