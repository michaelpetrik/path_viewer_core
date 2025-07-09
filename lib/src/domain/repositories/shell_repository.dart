import 'package:path_viewer_core/src/domain/entities/path_entry.dart';
import 'package:path_viewer_core/src/domain/entities/shell_type.dart';

abstract class ShellRepository {
  Future<ShellType> detectShell();
  Future<String> getPath();
  Future<List<PathEntry>> parsePath(String path, ShellType shellType);
}
