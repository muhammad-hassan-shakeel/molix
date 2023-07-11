import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:molix/config/theme/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> with HydratedMixin {
  ThemeCubit() : super(const ThemeState()) {
    hydrate();
  }

  void changeTheme(MolixTheme theme) => emit(ThemeState(themeData: theme));

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    if (json['themeData'] == 'DarkTheme') {
      return const ThemeState(themeData: DarkTheme());
    } else if (json['themeData'] == 'LightTheme') {
      return const ThemeState(themeData: LightTheme());
    } else {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    if (state.themeData is DarkTheme) {
      return {'themeData': 'DarkTheme'};
    } else if (state.themeData is LightTheme) {
      return {'themeData': 'LightTheme'};
    } else {
      return null;
    }
  }
}
