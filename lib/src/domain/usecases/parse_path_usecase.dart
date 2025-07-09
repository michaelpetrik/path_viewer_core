import 'package:path_viewer_core/src/domain/entities/path_entry.dart';
import 'package:path_viewer_core/src/domain/entities/shell_type.dart';
import 'package:path_viewer_core/src/domain/repositories/shell_repository.dart';

class ParsePathUsecase {
  final ShellRepository shellRepository;

  ParsePathUsecase(this.shellRepository);

  Future<List<PathEntry>> call(String path, ShellType shellType) async {
    return await shellRepository.parsePath(path, shellType);
  }
}
