import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample_bloc_mobile/src/app_options.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';
import 'package:sample_bloc_mobile/src/data/source/local_source.dart';
import 'package:sample_bloc_mobile/src/injector_container.dart';
import 'package:sample_bloc_mobile/src/presentation/components/bottom_sheet/custom_bottom_sheet.dart';

import '../../../../components/snack/snack.dart';
import 'widgets/language_bottom_widget.dart';
import 'widgets/theme_bottom_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final options = AppOptions.of(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.grey.shade50,
        backgroundColor: Colors.white,
        title: Text(
          context.tr('spravka'),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  void showCustomSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: RichText(
          text: TextSpan(
            text: message,
            style: TextStyle(
              color: Colors.white, // Change the text color here
              fontSize: 16, // Change the font size here
              fontWeight: FontWeight.bold, // Change the font weight here
            ),
          ),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xFF79B531),
      ),
    );
  }
}
