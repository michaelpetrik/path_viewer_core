import 'package:path_viewer_core/src/data/datasources/path_parser.dart';
import 'package:path_viewer_core/src/data/datasources/path_provider.dart';
import 'package:path_viewer_core/src/data/datasources/shell_detector.dart';
import 'package:path_viewer_core/src/data/datasources/zsh_path_parser.dart';
import 'package:path_viewer_core/src/data/repositories/shell_repository_impl.dart';
import 'package:path_viewer_core/src/domain/entities/shell_type.dart';
import 'package:path_viewer_core/src/domain/repositories/shell_repository.dart';
import 'package:path_viewer_core/src/domain/usecases/detect_shell_usecase.dart';
import 'package:path_viewer_core/src/domain/usecases/get_and_parse_usecase.dart';
import 'package:path_viewer_core/src/domain/usecases/parse_path_usecase.dart';

class DiContainer {
  static final DiContainer _instance = DiContainer._();
  late final ShellRepository shellRepository;
  late final ParsePathUsecase parsePathUsecase;
  late final DetectShellUsecase detectShellUsecase;
  late final GetAndParsePathUsecase getAndParsePathUsecase;

  factory DiContainer() {
    return _instance;
  }

  DiContainer._() {
    _init();
  }

  void _init() {
    final ShellDetector shellDetector = ShellDetectorImpl();
    final Map<ShellType, PathParser> parsers = _parsers();
    final PathProvider pathProvider = PathProviderImpl();
    shellRepository = ShellRepositoryImpl(shellDetector: shellDetector, parsers: parsers, pathProvider: pathProvider);
    parsePathUsecase = ParsePathUsecase(shellRepository);
    detectShellUsecase = DetectShellUsecase(shellRepository);
    getAndParsePathUsecase = GetAndParsePathUsecase(shellRepository);
  }

  // TODO: Add more parsers for other shells
  Map<ShellType, PathParser> _parsers() {
    return {
      // ShellType.bash: BashPathParser(),
      ShellType.zsh: ZshPathParser(),
      // ShellType.fish: FishPathParser(),
      // ShellType.powershell: PowershellPathParser(),
    };
  }
}
