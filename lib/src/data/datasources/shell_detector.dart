import 'dart:io';

import 'package:path_viewer_core/src/domain/entities/shell_type.dart';

abstract class ShellDetector {
  Future<ShellType> detect();
}

class ShellDetectorImpl implements ShellDetector {
  @override
  Future<ShellType> detect() async {
    if (Platform.isWindows) {
      final comSpec = Platform.environment['ComSpec'] ?? '';
      if (comSpec.toLowerCase().contains('powershell')) {
        return ShellType.powershell;
      } else if (comSpec.toLowerCase().contains('cmd.exe')) {
        return ShellType.cmd;
      }
      return ShellType.unknown;
    } else {
      final shell = Platform.environment['SHELL'] ?? '';
      if (shell.contains('zsh')) return ShellType.zsh;
      if (shell.contains('bash')) return ShellType.bash;
      if (shell.contains('fish')) return ShellType.fish;
      return ShellType.unknown;
    }
  }
}
