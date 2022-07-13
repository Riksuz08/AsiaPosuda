import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/config/routes/app_routes.dart';
import 'package:sample_bloc_mobile/src/core/l10n/translations.dart';
import 'package:sample_bloc_mobile/src/presentation/widgets/button/custom_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslations.of(context).profile),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.settings);
              },
              text: AppTranslations.of(context).settings,
            ),
          ),
        ],
      ),
    );
  }
}
