import 'config/environment.dart';
import 'main_common.dart';

Future<void> main() async {
  mainCommon(const Environment(
      apiKey: "61384ac76ce6b6404a854f441c11ca17",
      baseUrl: "api.themoviedb.org"));
}
