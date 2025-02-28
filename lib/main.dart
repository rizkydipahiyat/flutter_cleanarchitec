import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ca/config/routes/routes.dart';
import 'package:my_ca/config/theme/app_themes.dart';
import 'package:my_ca/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:my_ca/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:my_ca/features/daily_news/presentation/pages/home/daily_news.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const DailyNews(),
      ),
    );
  }
}
