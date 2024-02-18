import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/presentation/components/awesome/awesome_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_options.dart';
import '../../bloc/splash/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  bool selectedValue = false;
  bool first = true;
  bool visible = false;

  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(const SplashEvent());
    getFirst();
    WidgetsFlutterBinding.ensureInitialized();
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setAppId('ad050e7d-16a8-433e-abc3-ef19a554c5eb');
    OneSignal.shared.promptUserForPushNotificationPermission().then((value) {
      print('Access: $value');
    });
  }

  Future<void> getFirst() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? firstValue = prefs.getBool('first');
    setState(() {
      first = firstValue ?? true;
    });
  }

  int lang = 0;
  Future<void> saveFirst() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first', false);
  }

  @override
  Widget build(BuildContext context) => BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (first) {
            visible = true;
          } else {
            if (state.isTimerFinished) {
              Navigator.pushReplacementNamed(
                context,
                Routes.main,
              );
            }
          }
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
          ),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/png/asia.png'),
                  ),
                ),
                Visibility(
                  visible: first,
                  child: Center(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                'Добро пожаловать в',
                                style: TextStyle(fontSize: 24),
                              ),
                              Text(
                                'Asia Posuda',
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Выберите язык приложения',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedValue = false;
                                  if (!selectedValue) {
                                    lang = 2;
                                  }
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                          value: true,
                                          groupValue: !selectedValue,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              selectedValue = !value!;
                                              if (!selectedValue) {
                                                print('2');
                                              }
                                            });
                                          },
                                        ),
                                        Divider(),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'O\'zbek tili',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Image.asset(
                                        'assets/png/uzbekistan.png',
                                        scale: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedValue = true;
                                  if (selectedValue) {
                                    lang = 1;
                                  }
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                          value: true,
                                          groupValue: selectedValue,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              selectedValue = value!;
                                              if (selectedValue) {
                                                print('1');
                                              }
                                            });
                                          },
                                        ),
                                        SizedBox(width: 5),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Русский',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Image.asset(
                                        'assets/png/russia.png',
                                        scale: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            saveFirst();
                            print('Continue tapped');
                            if (lang == 1) {
                              AppOptions.update(
                                context,
                                AppOptions.of(context)
                                    .copyWith(locale: const Locale('ru')),
                              );
                            } else if (lang == 2) {
                              AppOptions.update(
                                context,
                                AppOptions.of(context)
                                    .copyWith(locale: const Locale('uz')),
                              );
                            } else {
                              AppOptions.update(
                                context,
                                AppOptions.of(context)
                                    .copyWith(locale: const Locale('uz')),
                              );
                            }
                            Navigator.pushReplacementNamed(
                              context,
                              Routes.main,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text('Продолжить'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
