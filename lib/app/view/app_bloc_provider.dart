import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/app/view/app.dart';
import 'package:photo_gallery/dark_mode/cubit/theme_cubit.dart';

class AppBlocProvider extends StatelessWidget {
  const AppBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: const App(),
    );
  }
}
