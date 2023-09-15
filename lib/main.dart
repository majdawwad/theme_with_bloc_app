import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_app_with_bloc/bloc/theme_bloc.dart';
import 'package:theme_app_with_bloc/home_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc()..add(GetCurrentThemeEvent()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is LoadedThemeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state.themeData,
              title: 'Theme App',
              home: const HomePageView(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
