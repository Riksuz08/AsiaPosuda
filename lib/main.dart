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
