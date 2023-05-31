import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mcs_calculator/pages/HomePage.dart';
import 'package:mcs_calculator/viewmodels/cs_model.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

AdaptiveThemeMode? savedThemeMode;



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(
    ChangeNotifierProvider<ComputingSystemModel>(
      create: (context) => ComputingSystemModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  // TODO add more locales
  static void toggleLocale(BuildContext context) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    if(state?.locale?.languageCode == "ru"){
      state?.setLocale(const Locale("en"));
    }
    state?.setLocale(const Locale("ru"));
  }
}

class _MyAppState extends State<MyApp> {
  Locale? locale;

  setLocale(Locale locale) {
    setState(() {
      locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        useMaterial3: true,
        hintColor: Colors.amber,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        useMaterial3: true,
        hintColor: Colors.amber,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: "MCS calculator",
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: theme,
        darkTheme: darkTheme,
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
        locale: locale,
      ),
    );
  }
}
