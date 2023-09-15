import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_app_with_bloc/app_theme.dart';
import 'package:theme_app_with_bloc/bloc/theme_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: AppTheme.values.length,
        itemBuilder: (context, index) {
          final itemAppTheme = AppTheme.values[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Card(
              color: appThemeData[itemAppTheme]!.primaryColor,
              child: ListTile(
                title: Text(
                  itemAppTheme.name,
                  style: appThemeData[itemAppTheme]!.textTheme.titleMedium,
                ),
                onTap: () {
                  context.read<ThemeBloc>().add(
                        ThemeChangedEvent(
                          theme: itemAppTheme,
                        ),
                      );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
