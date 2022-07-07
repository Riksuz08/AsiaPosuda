import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_bloc_mobile/src/app.dart';

import 'src/data/source/local_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// initial
  await Hive.initFlutter();

  /// local source
  await LocalSource.getInstance();

  runApp(const MainApp());
}


// flutter pub run flutter_launcher_icons:main
// flutter run -d windows --no-sound-null-safety
// flutter build apk --release --no-sound-null-safety
// flutter build apk --split-per-abi --no-sound-null-safety
// flutter build appbundle --release --no-sound-null-safety
// flutter pub run build_runner watch --delete-conflicting-outputs