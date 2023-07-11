part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState({this.themeData = const LightTheme()});

  final MolixTheme themeData;

  @override
  List<Object> get props => [themeData];
}
