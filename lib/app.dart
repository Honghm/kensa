import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kensa/providers/order_provider.dart';
import 'package:kensa/route.dart';
import 'package:kensa/screen/login.dart';
import 'package:provider/provider.dart';

import 'common/styles.dart';
import 'generated/i10n.dart';
import 'models/appModel.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _app = AppModel();
  ThemeData getTheme(context) {
    AppModel appModel = Provider.of<AppModel>(context);
    bool isDarkTheme = appModel.darkTheme ?? true;

    if (isDarkTheme) {
      return buildDarkTheme(appModel.locale)
          .copyWith(primaryColor: Colors.black);
    }
    return buildLightTheme(appModel.locale)
        .copyWith(primaryColor: Colors.white);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppModel>.value(
      value: _app,
      child: Consumer<AppModel>(
        builder: (context, value, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: AppModel()),
              ChangeNotifierProvider.value(value: OrderProvider()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: Locale("vi", "VN"),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              home: Scaffold(body: LoginScreen()),
              routes: Routes.getAll(),
              theme: getTheme(context),
            ),
          );
        },
      ),
    );
  }
}
