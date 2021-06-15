import 'package:demowallpaper/core/enums/viewState.dart';
import 'package:demowallpaper/core/models/image.dart';
import 'package:demowallpaper/core/services/api.dart';
import 'package:demowallpaper/core/viewmodels/basemodel.dart';

import '../../locator.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();
  late List<ImageModel> images;
  late int? currentPage;

  Future getImages(int page) async {
    setState(ViewState.Busy);
    currentPage = page;
    print(currentPage);

    images = await _api.getAllImages(page);
    print(images);
    setState(ViewState.Idle);
  }
}
