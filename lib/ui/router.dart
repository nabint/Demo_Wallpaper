import 'package:demowallpaper/core/models/image.dart';
import 'package:demowallpaper/ui/views/detailview.dart';
import 'package:demowallpaper/ui/views/homeview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'detail':
        var image = settings.arguments as ImageModel;
        return MaterialPageRoute(
          builder: (_) => DetailView(
            image: image,
          ),
        );
      // return MaterialPageRoute();

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
