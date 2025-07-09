import 'package:path_viewer_core/src/data/datasources/shell_detector.dart';
import 'package:path_viewer_core/src/domain/entities/shell_type.dart';
import 'package:test/test.dart';

void main() {
  group("ShellDetectorImpl", () {
    test("should return the correct shell type", () async {
      final shellDetector = ShellDetectorImpl();
      final shellType = await shellDetector.detect();
      expect(shellType, ShellType.zsh);
    });
  });
}
