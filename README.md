# PATH Viewer • Core Library 🛠️

> Pure **Dart** utilities to inspect, parse and tidy your system’s `PATH` variable – the foundation of the PATH Viewer CLI & GUI.

[![Pub](https://img.shields.io/pub/v/path_viewer_core)](https://pub.dev/packages/path_viewer_core)
[![License](https://img.shields.io/badge/License-MIT-teal.svg)](LICENSE)
[![Made with Dart](https://img.shields.io/badge/Made%20with-Dart-0175C2?logo=dart&logoColor=white)](https://dart.dev)

---

`path_viewer_core` offers the **domain layer** for PATH operations in a platform-agnostic way:

*️⃣ _No I/O, no shell mucking-about – just clean, test-driven business logic ready to embed in your own tools._

## ✨ Features

| Capability | Status |
|------------|:------:|
| Parse raw `PATH` string into strongly-typed entries (`PathEntry`) | ✅ |
| Detect & list duplicate entries | ✅ |
| Detect current shell type (bash/zsh/fish/cmd/powershell) | ✅ |
| Produce a de-duplicated `PATH` string | 🔜 |
| Validate entries & highlight broken paths | 🔜 |
| Suggest optimised ordering for faster look-ups | 🔜 |

## 📦 Installation

Add the package to your project:

```bash
dart pub add path_viewer_core
```

Or via `pubspec.yaml`:

```yaml
dependencies:
  path_viewer_core: ^1.0.0
```

## 🚀 Usage

```dart
import 'package:path_viewer_core/path_viewer_core.dart';

void main() {
  final detector = ShellDetector();
  final shell = detector.detect(); // ShellType.zsh, e.g.

  final provider = PathProvider();
  final rawPath = provider.read();

  final entries = StandardPathParser().parse(rawPath);
  final duplicates = entries.where((e) => e.isDuplicate).toList();

  print('Found ${duplicates.length} duplicates:');
  duplicates.forEach(print);
}
```

See the `example/` directory for more hands-on snippets.

## 🧪 Running tests

```bash
melos bootstrap
melos test
```

## 🤝 Contributing

Bug reports, suggestions and PRs are very welcome! Please read the [Code of Conduct](CODE_OF_CONDUCT.md) and open an issue before large changes to align on direction.

## 📜 License

Distributed under the MIT License. See [LICENSE](LICENSE) for details.

---

Made with ❤️ & ☕ by [mpetrik.dev](https://www.buymeacoffee.com/mpetrikdev)
