import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/features/common/navigations/bottom_navbar.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  //MultiProvider to allow app access to providers anywhere inside the app
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService =
      AuthService(); //to get user data if token exists and redirect user directly

  @override //intial on page load
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      //-------------------
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor, //bg_colors
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor, //bgs holding data (text...)
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, //all icons color
          ),
        ),
      ),
      //--------------------
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty ? const BottomBar() : const AuthScreen(),
      //----------------
    );
  }
}
