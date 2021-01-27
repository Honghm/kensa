import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';


class S {
  S();

  static S current;

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();


  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();

      return S.current;
    });
  }

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }


  /// `loginCapitalization `
  String get loginCapitalization {
    return Intl.message(
      'LOGIN',
      name: 'loginCapitalization',
      desc: '',
      args: [],
    );
  }
  /// `login`
  String get login{
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `forgot password`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }
  /// `phoneNumber`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }
  /// `password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }
  /// `remember login`
  String get rememberLogin {
    return Intl.message(
      'Remember login',
      name: 'rememberLogin',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle appraisal`
  String get vehicleAppraisal {
    return Intl.message(
      'Vehicle appraisal',
      name: 'vehicleAppraisal',
      desc: '',
      args: [],
    );
  }
  /// `MEMBER`
  String get memberCapitalization {
    return Intl.message(
      'MEMBER',
      name: 'memberCapitalization',
      desc: '',
      args: [],
    );
  }
  /// `ordersNew`
  String get ordersNew {
    return Intl.message(
      'New',
      name: 'ordersNew',
      desc: '',
      args: [],
    );
  }
  /// `Processing`
  String get ordersProcessing {
    return Intl.message(
      'Processing',
      name: 'ordersProcessing',
      desc: '',
      args: [],
    );
  }
  /// `completed`
  String get orderCompleted {
    return Intl.message(
      'Completed',
      name: 'orderCompleted',
      desc: '',
      args: [],
    );
  }
  /// `declinedCheck`
  String get oderDeclinedCheck {
    return Intl.message(
      'Declined check',
      name: 'oderDeclinedCheck',
      desc: '',
      args: [],
    );
  }
  /// `search`
  String get search {
    return Intl.message(
      'Search orders',
      name: 'search',
      desc: '',
      args: [],
    );
  }
  /// `nameVehicleOwner`
  String get nameVehicleOwner {
    return Intl.message(
      'Vehicle owner name',
      name: 'nameVehicleOwner',
      desc: '',
      args: [],
    );
  }
  /// `phoneVehicleOwner`
  String get phoneVehicleOwner {
    return Intl.message(
      'Phone',
      name: 'phoneVehicleOwner',
      desc: '',
      args: [],
    );
  }

  /// `addressVehicleOwner`
  String get addressVehicleOwner {
    return Intl.message(
      'Address',
      name: 'addressVehicleOwner',
      desc: '',
      args: [],
    );
  }
  /// `Waiting`
  String get waiting {
    return Intl.message(
      'Waiting',
      name: 'waiting',
      desc: '',
      args: [],
    );
  }
  /// `Checking`
  String get checking {
    return Intl.message(
      'Checking',
      name: 'checking',
      desc: '',
      args: [],
    );
  }
  /// `goCheck`
  String get goCheck {
    return Intl.message(
      'Go to check',
      name: 'goCheck',
      desc: '',
      args: [],
    );
  }
  /// `finished`
  String get finished {
    return Intl.message(
      'Finished',
      name: 'finished',
      desc: '',
      args: [],
    );
  }
  /// `refuse`
  String get refuse {
    return Intl.message(
      'Refuse',
      name: 'refuse',
      desc: '',
      args: [],
    );
  }

  /// `listCheck`
  String get listCheck {
    return Intl.message(
      'Detailed list to check',
      name: 'listCheck',
      desc: '',
      args: [],
    );
  }
  /// `information`
  String get information {
    return Intl.message(
      'Information',
      name: 'information',
      desc: '',
      args: [],
    );
  }
  /// `vehicle documentation`
  String get vehicleDocument {
    return Intl.message(
      'Vehicle document',
      name: 'vehicleDocument',
      desc: '',
      args: [],
    );
  }
  /// `important details`
  String get importantDetails {
    return Intl.message(
      'Important details',
      name: 'importantDetails',
      desc: '',
      args: [],
    );
  }
  /// `for Italian SH models`
  String get forItalianSH {
    return Intl.message(
      'For Italian SH models',
      name: 'forItalianSH',
      desc: '',
      args: [],
    );
  }
  /// `chassis number, engine number`
  String get chassisNumber {
    return Intl.message(
      'Chassis number',
      name: 'chassisNumber',
      desc: '',
      args: [],
    );
  }
  /// `engine number`
  String get engineNumber {
    return Intl.message(
      'Engine number',
      name: 'engineNumber',
      desc: '',
      args: [],
    );
  }
  /// `Electricity`
  String get electricity {
    return Intl.message(
      'Electricity',
      name: 'electricity',
      desc: '',
      args: [],
    );
  }
  /// `Fi`
  String get fi {
    return Intl.message(
      'Fi',
      name: 'fi',
      desc: '',
      args: [],
    );
  }
  /// `Sensors`
  String get sensors {
    return Intl.message(
      'Sensors',
      name: 'sensors',
      desc: '',
      args: [],
    );
  }
  /// `take a test vehicle`
  String get takeATest{
    return Intl.message(
      'Take a test',
      name: 'takeATest',
      desc: '',
      args: [],
    );
  }
  /// `Additional details`
  String get additionalDetails {
    return Intl.message(
      'Additional details',
      name: 'additionalDetails',
      desc: '',
      args: [],
    );
  }
  /// `Another Details`
  String get anotherDetails {
    return Intl.message(
      'Another details',
      name: 'anotherDetails',
      desc: '',
      args: [],
    );
  }
  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}