part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState({this.themeData = const DarkTheme()});

  final MolixTheme themeData;

  @override
  List<Object> get props => [themeData];
}
