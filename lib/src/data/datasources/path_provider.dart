import 'dart:io';

abstract class PathProvider {
  Future<String> getPath();
}

class PathProviderImpl implements PathProvider {
  @override
  Future<String> getPath() async {
    return Platform.environment['PATH'] ?? '';
  }
}
