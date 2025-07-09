import 'package:path_viewer_core/src/domain/entities/shell_type.dart';
import 'package:path_viewer_core/src/domain/repositories/shell_repository.dart';

class DetectShellUsecase {
  final ShellRepository shellRepository;

  DetectShellUsecase(this.shellRepository);

  Future<ShellType> call() async {
    return await shellRepository.detectShell();
  }
}
