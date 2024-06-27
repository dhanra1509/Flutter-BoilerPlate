import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:{{name}}/bloc/authentication/authentication_bloc.dart';
import 'package:{{name}}/constants/i18n/strings.g.dart';
import 'package:{{name}}/constants/index.dart';

import 'package:{{name}}/navigation/app_navigation.dart';
import 'package:{{name}}/navigation/navigation.dart';
import 'package:{{name}}/injectionContainer/injection_container.dart'
    as di;
import 'package:{{name}}/pages/restart/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Hive.initFlutter();
  await Hive.openBox('userBox');
  runApp(TranslationProvider(child: const Restart(child: MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final routeConfig = NavigationConfig(stackNavigation);

  /// For getting the saved localization
  String? appLanguage;
  var userBox = Hive.box(HiveKeys.userBox);
  List<AppLocale>? appLocales = AppLocale.values;

  @override
  void initState() {
    super.initState();
    appLanguage = userBox.get(HiveKeys.appLanguage);
    handleGetLanguage();
  }

  handleGetLanguage() async {
    AppLocale? matchingLocale = appLocales!.firstWhere(
      (locale) => locale.languageCode == appLanguage,
      orElse: AppLocale.en
    );
    LocaleSettings.setLocale(matchingLocale);
      print('currentLang=> ${LocaleSettings.useDeviceLocale()}');

  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
              create: (BuildContext context) =>
                  di.serviceLocator<AuthenticationBloc>())
        ],
        child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: "Demo",
            theme: ThemeData(brightness: Brightness.light),
            darkTheme: ThemeData(brightness: Brightness.dark),
            themeMode: ThemeMode.system,
            restorationScopeId: 'app',
            routerConfig: routeConfig.router));
  }
}
