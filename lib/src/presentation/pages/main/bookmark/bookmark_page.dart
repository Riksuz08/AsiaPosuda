import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/l10n/translations.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslations.of(context).bookmark),
      ),
    );
  }
}
