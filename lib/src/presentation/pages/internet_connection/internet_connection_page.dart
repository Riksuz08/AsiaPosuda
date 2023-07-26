import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

class InternetConnectionPage extends StatefulWidget {
  const InternetConnectionPage({super.key});

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
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
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
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(36),
              child: Image.asset(
                'assets/png/no_internet.png',
                height: context.kSize.height * 310 / 812,
                width: context.kSize.width * 306 / 375,
              ),
            ),
            const Text(
              'Нет доступа к интернету',
              style: TextStyle(
                color: Colors.black,
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
          minimum: const EdgeInsets.all(16),
          child: ElevatedButton(
            child: const Text('Попробовать снова'),
            onPressed: () async {
              setState(() {
                isLoading = true;
              });
              await Future<void>.delayed(const Duration(milliseconds: 300));
              final connectivityResult = await Connectivity().checkConnectivity();
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
