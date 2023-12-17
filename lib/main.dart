import 'package:academy/help/colors.dart';
import 'package:academy/help/localization.dart';
import 'package:academy/screen/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state =
    context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Map<int, Color> color =
    {
      50:Color.fromRGBO(184,220,255, .1),
      100:Color.fromRGBO(184,220,255, .2),
      200:Color.fromRGBO(184,220,255, .3),
      300:Color.fromRGBO(184,220,255, .4),
      400:Color.fromRGBO(184,220,255, .5),
      500:Color.fromRGBO(184,220,255, .6),
      600:Color.fromRGBO(184,220,255, .7),
      700:Color.fromRGBO(184,220,255, .8),
      800:Color.fromRGBO(184,220,255, .9),
      900:Color.fromRGBO(184,220,255, 0.4),
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Alkadri Snap",
      theme: ThemeData(
        scaffoldBackgroundColor: AcademyColors.backGroundBlue,
        primarySwatch:MaterialColor(0xff007869, color),
        fontFamily: 'Cairo',
        textTheme:
        TextTheme(displayMedium: TextStyle(color: Colors.black)),
        appBarTheme: AppBarTheme(
            elevation: 0,
            centerTitle: true,
            color: AcademyColors.maineBlue,
            iconTheme: IconThemeData(color: AcademyColors.backGroundBlue,),
            titleTextStyle: TextStyle(
                color: AcademyColors.backGroundBlue,
                fontSize: 16,
                fontWeight:FontWeight.w600,
                fontFamily: 'Cairo')),
      ),
      supportedLocales: const [
        Locale('ar', ''),
        Locale('en', ''),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (currentLang, supportLang) {
        if (sharedPreferences.getString("lang") != null) {
          supportLang.forEach((element) {
            if (element.languageCode == sharedPreferences.getString("lang")) {
              _locale = element;
            }
          });
          return _locale;
        } else
        {
          if (currentLang != null) {
            for (Locale local in supportLang) {
              if (local.languageCode == currentLang.languageCode) {
                sharedPreferences.setString("lang", currentLang.languageCode);
                return currentLang;
              }
            }
          }
        }
        return supportLang.first;
      },
      locale: _locale,
      home:  Login(),
    );
  }
}

