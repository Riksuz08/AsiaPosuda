import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/config/themes/themes.dart';
import 'package:sample_bloc_mobile/src/presentation/components/buttons/bottom_navigation_button.dart';
import 'package:sample_bloc_mobile/src/presentation/components/buttons/select_lang_button.dart';

class SelectLangPage extends StatefulWidget {
  const SelectLangPage({super.key});

  @override
  State<SelectLangPage> createState() => _SelectLangPageState();
}

class _SelectLangPageState extends State<SelectLangPage> {
  String? selectedLang;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: AppUtils.kPaddingHorizontal16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppUtils.kBoxHeight24,
              AppUtils.kBoxHeight24,
              const Center(
                child: Text(
                  'Cardio app',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2A2828),
                  ),
                ),
              ),
              AppUtils.kSpacer,
              Text('Выберите язык', style: ThemeTextStyles.light.appBarTitle),
              AppUtils.kBoxHeight20,
              SelectLangButton(
                onPressed: () {
                  selectedLang = 'ru';
                  setState(() {});
                },
                isSelected: selectedLang == 'ru',
                flag: 'assets/png/flag_ru.png',
                lang: 'Русский',
              ),
              AppUtils.kBoxHeight16,
              SelectLangButton(
                onPressed: () {
                  selectedLang = 'uz';
                  setState(() {});
                },
                isSelected: selectedLang == 'uz',
                flag: 'assets/png/flag_uz.png',
                lang: 'O’zbekcha',
              ),
              AppUtils.kSpacer,
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationButton(
          child: ElevatedButton(
            onPressed: () {
              if (selectedLang != null && !isLoading) {
                isLoading = true;
                localSource
                  ..setLocale(selectedLang!)
                  ..setLangSelected(value: true);
                Navigator.pushReplacementNamed(context, Routes.main);
                isLoading = false;
              }
            },
            child: const Text(
              'Продолжить',
            ),
          ),
        ),
      );
}
