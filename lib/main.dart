import 'package:demowallpaper/core/services/api.dart';
import 'package:demowallpaper/locator.dart';
import 'package:demowallpaper/ui/views/homeview.dart';
import 'package:flutter/material.dart';
import 'ui/router.dart' as ROUTE;

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // Api _api = Api();

  @override
  Widget build(BuildContext context) {
    // _api.getUser('tqkDGqPW8Vo');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: ROUTE.Router.generateRoute,
    );
  }
}
