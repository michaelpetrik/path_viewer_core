import 'package:path_viewer_core/src/domain/entities/path_entry.dart';

abstract class PathParser {
  String get pathEnvVar;
  String get dividerChar;
  List<PathEntry> parse(String path);
}
