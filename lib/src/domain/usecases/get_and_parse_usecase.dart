import 'package:path_viewer_core/src/domain/entities/path_entry.dart';
import 'package:path_viewer_core/src/domain/repositories/shell_repository.dart';

class GetAndParsePathUsecase {
  final ShellRepository shellRepository;

  GetAndParsePathUsecase(this.shellRepository);

  Future<List<PathEntry>> call() async {
    final shellType = await shellRepository.detectShell();
    final path = await shellRepository.getPath();
    return shellRepository.parsePath(path, shellType);
  }
}
