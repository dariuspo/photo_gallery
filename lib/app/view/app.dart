import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/app/router/app_router.dart';
import 'package:photo_gallery/app/view/theme/styles.dart';
import 'package:photo_gallery/dark_mode/cubit/theme_cubit.dart';
import 'package:photo_gallery/l10n/l10n.dart';

final appRouter = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return MaterialApp.router(
          theme: Styles.theme(
            Brightness.light,
            context,
          ),
          darkTheme: Styles.theme(
            Brightness.dark,
            context,
          ),
          themeMode: state,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
        );
      },
    );
  }
}
