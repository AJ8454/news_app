part of 'top_headlines_new_cubit.dart';

abstract class TopHeadlinesNewState extends Equatable {
  const TopHeadlinesNewState();
}

class TopHeadlinesNewInitial extends TopHeadlinesNewState {
  @override
  List<Object> get props => [];
}

class TopHeadlinesNewLoading extends TopHeadlinesNewState {
  final List<Article?>? oldArticles;
  final bool isFirstFetch;
  const TopHeadlinesNewLoading(this.oldArticles, {this.isFirstFetch = false});
  @override
  List<Object> get props => [];
}

class TopHeadlinesNewLoaded extends TopHeadlinesNewState {
  final List<Article?>? articles;

  const TopHeadlinesNewLoaded({this.articles});
  @override
  List<Object> get props => [];
}

class TopHeadlinesNewFailure extends TopHeadlinesNewState {
  final String? errorMssg;
  const TopHeadlinesNewFailure({this.errorMssg});

  @override
  List<Object> get props => [];
}
