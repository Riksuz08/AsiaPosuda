import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_colors.dart';
import 'package:sample_bloc_mobile/src/presentation/components/button/custom_button.dart';

class InternetConnectionPage extends StatefulWidget {
  const InternetConnectionPage({Key? key}) : super(key: key);

  @override
  InternetConnectionPageState createState() => InternetConnectionPageState();
}

class InternetConnectionPageState extends State<InternetConnectionPage> {
  bool isLoading = false;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result != ConnectivityResult.none) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(36),
              child: Image.asset(
                'assets/png/no_internet.png',
                height: size.height * 310 / 812,
                width: size.width * 306 / 375,
              ),
            ),
            const Text(
              'Нет доступа к интернету',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Проверьте подключение к интернету',
              style: TextStyle(
                color: Color(0xff818C99),
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: CustomButton(
            text: 'Попробовать снова',
            height: 50,
            onTap: () async {
              setState(() {
                isLoading = true;
              });
              await Future.delayed(const Duration(milliseconds: 300));
              var connectivityResult = await Connectivity().checkConnectivity();
              setState(() {
                isLoading = false;
              });
              if (connectivityResult != ConnectivityResult.none) {
                if (!mounted) return;
                Navigator.of(context).pop();
              }
            },
          ),
        ),
      ),
    );
  }
}
