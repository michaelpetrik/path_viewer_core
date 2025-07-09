import 'package:path_viewer_core/src/data/datasources/path_parser.dart';
import 'package:path_viewer_core/src/domain/entities/path_entry.dart';

abstract class StandardPathParser implements PathParser {
  @override
  String get pathEnvVar => 'PATH';
  @override
  String get dividerChar => ':';
  @override
  List<PathEntry> parse(String path) {
    return path.split(dividerChar).map(PathEntry.new).toList();
  }
}
