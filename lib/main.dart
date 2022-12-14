import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_cards/blocs/settings_cubit/settings_cubit.dart';
import 'package:flutter_ui_cards/config/custom_theme.dart';
import 'package:flutter_ui_cards/home_page/home_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => SettingsCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cards',
      theme: CustomTheme.dartTheme,
      home: const HomePage(),
    );
  }
}
