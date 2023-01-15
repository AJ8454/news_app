import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/app/features/top_headlines_news/top_headline_news_injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final http.Client httpClient = http.Client();

  sl.registerLazySingleton<http.Client>(() => httpClient);

  await topHeadlineNewsInjectionContainer();
}
