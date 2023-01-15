import 'package:news_app/app/features/top_headlines_news/data/data_source/top_headline_news_api_repository_impl.dart';
import 'package:news_app/app/features/top_headlines_news/domain/repository/top_headline_news_api_repository.dart';
import 'package:news_app/app/features/top_headlines_news/domain/usecases/top_headline_news_usecase.dart';
import 'package:news_app/app/features/top_headlines_news/presentation/cubit/top_headlines_new_cubit.dart';
import 'package:news_app/injection_container.dart';

Future<void> topHeadlineNewsInjectionContainer() async {
  // cubit
  sl.registerFactory<TopHeadlinesNewCubit>(
    () => TopHeadlinesNewCubit(topHeadlineNewsUseCase: sl.call()),
  );

  // usecase
  sl.registerLazySingleton<TopHeadlineNewsUseCase>(
    () => TopHeadlineNewsUseCase(repository: sl.call()),
  );

  // repository
  sl.registerLazySingleton<TopHeadlineNewsApiRepositoryInterface>(
    () => TopHeadlineNewsApiRepositoryImpl(httpClient: sl.call()),
  );
}
