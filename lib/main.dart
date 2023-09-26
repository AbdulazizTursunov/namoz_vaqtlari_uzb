import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namoz_vaqtlari_uzb/repository/repository.dart';
import 'package:namoz_vaqtlari_uzb/service/api_service.dart';
import 'package:namoz_vaqtlari_uzb/ui/tab_box.dart';
import 'blocs/dasy/days_bloc.dart';
import 'blocs/months/months_bloc.dart';

void main() {
  runApp(App(apiService: ApiService()));
}

class App extends StatelessWidget {
  const App({super.key, required this.apiService});

  final ApiService apiService;

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
                create: (_) => ApiRepository(apiService: apiService)),
          ],
          child: MultiBlocProvider(providers: [
            BlocProvider(
              create: (_) => DaysBloc(
                  apiRepository: ApiRepository(apiService: ApiService())),
            ),
            BlocProvider(
              create: (_) => MonthsBloc(
                apiRepository: ApiRepository(apiService: ApiService()),
              ),
            )
          ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TabBoxScreen(),
      );
}
