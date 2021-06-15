import 'package:demowallpaper/bloc/splash_screen_bloc.dart';
import 'package:demowallpaper/core/enums/viewState.dart';
import 'package:demowallpaper/core/viewmodels/homemodel.dart';
import 'package:demowallpaper/ui/views/baseview.dart';
import 'package:demowallpaper/ui/widgets/bottomNav.dart';
import 'package:demowallpaper/ui/widgets/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildHome(context);
  }

  BlocProvider<SplashScreenBloc> _buildHome(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenBloc(),
      child: Center(
        child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
          builder: (context, state) {
            if ((state is SplashScreenInitial) || (state is Loading)) {
              return SplashScreenWidget();
            } else if (state is Loaded) {
              return BaseView<HomeModel>(
                onModelReady: (model) => model.getImages(1),
                builder: (context, model, child) => Scaffold(
                  extendBody: true,
                  bottomNavigationBar:
                      model.state == ViewState.Busy ? null : BottomNav(),
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    title: Center(
                      child: Text(
                        'Home',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  body: model.state == ViewState.Busy
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView.count(
                          crossAxisCount: 2,
                          children: List.generate(
                            model.images.length,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () => Navigator.pushNamed(
                                      context, 'detail',
                                      arguments: model.images[index]),
                                  child: Image.network(
                                      model.images[index].imageUrl),
                                ),
                              );
                            },
                          ),
                        ),
                ),
              );
            }
            throw UnimplementedError();
          },
        ),
      ),
    );
  }
}
