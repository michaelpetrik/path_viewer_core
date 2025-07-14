import 'package:path_viewer_core/src/core/di/di_container.dart';
import 'package:path_viewer_core/src/utils/duplicates_extension.dart';

Future<List<String>> listPath() async {
  final useCase = DiContainer().getAndParsePathUsecase;
  print("Getting path...");
  final path = await useCase.call();
  print("Okay, here it is:");
  return path.map((e) => e.path).toList();
}

Future<List<String>> findDuplicates() async {
  final useCase = DiContainer().getAndParsePathUsecase;
  final pathEntries = await useCase.call();
  final duplicates = pathEntries.map((e) => e.path).duplicates();

  return duplicates;
}
