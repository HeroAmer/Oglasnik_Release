import 'package:Oglasnik/utils/colors_and_themes/themeData.dart';
import 'package:Oglasnik/utils/lifecycle_manager.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:Oglasnik/view/SignInPage/pages/signin.dart';
import 'package:Oglasnik/view/SplashScreen/pages/splash.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/categoryBrands.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewProductViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await DotEnv().load('.env');
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  ).then((_) {
    runApp(
      MyApp(),
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initCategoryNames();
    initCategoryBrands();
    return LifeCycleManager(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild.unfocus();
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: buildThemeData(),
          home: Splash(),
          routes: {
            "/back": (_) => AnonymousHome(),
            "/homeregister": (_) => RegisteredHome(),
            "/register": (_) => RegisterPage(),
            "/signin": (_) => SigninPage(),
          },
        ),
      ),
    );
  }
}
