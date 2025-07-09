import 'package:path_viewer_core/src/domain/entities/path_entry.dart';
import 'package:path_viewer_core/src/domain/entities/shell_type.dart';
import 'package:path_viewer_core/src/domain/repositories/shell_repository.dart';
import 'package:path_viewer_core/src/domain/usecases/detect_shell_usecase.dart';
import 'package:path_viewer_core/src/domain/usecases/parse_path_usecase.dart';
import 'package:test/test.dart';

class _MockShellRepository implements ShellRepository {
  final ShellType shellType;
  final List<PathEntry> pathEntries;

  _MockShellRepository({this.shellType = ShellType.bash, this.pathEntries = const []});

  @override
  Future<ShellType> detectShell() async {
    return shellType;
  }

  @override
  Future<List<PathEntry>> parsePath(String path, ShellType shellType) async {
    return pathEntries;
  }
}

void main() {
  group("DetectShellUsecase", () {
    test("should return the correct shell type", () async {
      final expectedShellType = ShellType.bash;

      final shellRepository = _MockShellRepository(shellType: expectedShellType);
      final detectShellUsecase = DetectShellUsecase(shellRepository);
      final shellType = await detectShellUsecase.call();
      expect(shellType, expectedShellType);
    });
  });
  group("ParsePathUsecase", () {
    test("should return the correct path entries", () async {
      final expectedPathEntries = [PathEntry("test")];

      final shellRepository = _MockShellRepository(pathEntries: expectedPathEntries);
      final parsePathUsecase = ParsePathUsecase(shellRepository);
      final pathEntries = await parsePathUsecase.call("test", ShellType.bash);
      expect(pathEntries, expectedPathEntries);
    });
  });
}
