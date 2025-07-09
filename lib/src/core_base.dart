import 'package:path_viewer_core/src/core/di/di_container.dart';

Future<List<String>> listPath() async {
  final useCase = DiContainer().getAndParsePathUsecase;
  print("Getting path...");
  final path = await useCase.call();
  print("Okay, here it is:");
  return path.map((e) => e.path).toList();
}
