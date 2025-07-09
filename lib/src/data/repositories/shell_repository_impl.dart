import 'package:path_viewer_core/src/data/datasources/path_parser.dart';
import 'package:path_viewer_core/src/data/datasources/path_provider.dart';
import 'package:path_viewer_core/src/data/datasources/shell_detector.dart';
import 'package:path_viewer_core/src/domain/entities/path_entry.dart';
import 'package:path_viewer_core/src/domain/entities/shell_type.dart';
import 'package:path_viewer_core/src/domain/repositories/shell_repository.dart';

class ShellRepositoryImpl implements ShellRepository {
  final ShellDetector shellDetector;
  final Map<ShellType, PathParser> parsers;
  final PathProvider pathProvider;

  ShellRepositoryImpl({required this.shellDetector, required this.parsers, required this.pathProvider});

  @override
  Future<ShellType> detectShell() async {
    final shellType = await shellDetector.detect();
    return shellType;
  }

  @override
  Future<String> getPath() async {
    final path = await pathProvider.getPath();
    return path;
  }

  @override
  Future<List<PathEntry>> parsePath(String path, ShellType shellType) async {
    final parser = parsers[shellType];
    if (parser == null) {
      throw Exception('No parser found for shell type: $shellType');
    }
    return parser.parse(path);
  }
}
