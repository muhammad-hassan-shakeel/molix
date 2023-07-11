import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:molix/features/theme/cubit/theme_cubit.dart';
import 'package:path_provider/path_provider.dart';

import 'features/login/views/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getTemporaryDirectory();
  HydratedBloc.storage =
      await HydratedStorage.build(storageDirectory: directory);
  runApp(const MolixApp());
}

class MolixApp extends StatelessWidget {
  const MolixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: state.themeData.themeData,
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
