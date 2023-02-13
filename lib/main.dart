import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:coffee_app_amplify/pages/loading_page.dart';
import 'package:coffee_app_amplify/pages/wrapper/wrapper.dart';
import 'package:coffee_app_amplify/utils/amplify_configure.dart';
import 'package:coffee_app_amplify/utils/app_themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: MyApp(
          key: UniqueKey(),
        )),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({required Key key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late final Widget _wrapper;
  @override
  void initState() {
    super.initState();
    AmplifyConfigure.configureAmplify();
    _wrapper = Wrapper(
      key: UniqueKey(),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Authenticator(
      initialStep: AuthenticatorStep.signIn,
      authenticatorBuilder: (context, authStep) {
        // ignore: missing_enum_constant_in_switch
        switch (authStep.currentStep) {
          case AuthenticatorStep.loading:
            return LoadingPage(key: UniqueKey());
        }
        return null;
      },
      signUpForm: SignUpForm.custom(fields: [
        SignUpFormField.username(),
        SignUpFormField.name(required: true),
        SignUpFormField.password(),
        SignUpFormField.passwordConfirmation(),
      ]),
      child: MaterialApp(
          theme: AppThemes.lightTheme,
          themeMode: ThemeMode.system,
          darkTheme: AppThemes.darkTheme,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          builder: Authenticator.builder(),
          home: _wrapper),
    );
  }
}
