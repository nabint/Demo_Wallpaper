import 'package:demowallpaper/core/enums/viewState.dart';
import 'package:demowallpaper/core/models/image.dart';
import 'package:demowallpaper/core/viewmodels/detailmodel.dart';
import 'package:demowallpaper/ui/views/baseview.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final ImageModel image;
  const DetailView({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DetailModel>(
      onModelReady: (model) => model.getDetails(image.id),
      builder: (context, model, child) {
        return model.state == ViewState.Busy
            ? Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  title: Center(
                    child: Text(
                      "Detail",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(image.imageUrl),
                      image.description != null
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Text(
                                image.description.toString(),
                              ),
                            )
                          : SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Posted By:",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                model.user.profileUrl.toString(),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model.user.name.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    model.user.bio.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
