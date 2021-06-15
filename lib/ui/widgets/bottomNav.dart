import 'package:demowallpaper/core/viewmodels/homemodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeModel>(builder: (context, model, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Container(
          height: 50,
          decoration: new BoxDecoration(
            color: const Color(0xFFEBCECB).withOpacity(0.6),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: InkWell(
                  radius: 20,
                  onTap: () {
                    model.getImages(1);
                  },
                  splashColor: Colors.blue,
                  child: Center(
                    child: Text(
                      '1',
                      style: model.currentPage == 1
                          ? TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
                          : null,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: InkWell(
                  splashColor: Colors.blue,
                  onTap: () {
                    model.getImages(2);
                  },
                  child: Center(
                    child: Text(
                      '2',
                      style: model.currentPage == 2
                          ? TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
                          : null,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    model.getImages(3);
                  },
                  splashColor: Colors.blue,
                  child: Center(
                    child: Text(
                      '3',
                      style: model.currentPage == 3
                          ? TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
                          : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
