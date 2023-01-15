import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/features/top_headlines_news/presentation/cubit/top_headlines_new_cubit.dart';
import 'package:news_app/app/features/top_headlines_news/presentation/pages/top_headlines_news_page.dart';
import 'package:news_app/app/routes/on_generate_route.dart';
import 'package:news_app/app/splash/splash_screen.dart';
import 'package:news_app/core/http_manager.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TopHeadlinesNewCubit>(
            create: (context) => di.sl<TopHeadlinesNewCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        onGenerateRoute: OnGenerateRoute.route,
        theme: ThemeData(brightness: Brightness.dark),
        initialRoute: "/",
        routes: {
          "/": (context) => const SplashScreen(child: TopHeadLinesPage()),
        },
      ),
    );
  }
}
