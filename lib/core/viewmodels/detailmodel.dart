import 'package:demowallpaper/core/enums/viewState.dart';
import 'package:demowallpaper/core/models/user.dart';
import 'package:demowallpaper/core/services/api.dart';
import 'package:demowallpaper/core/viewmodels/basemodel.dart';

class DetailModel extends BaseModel {
  Api _api = Api();
  late User user;
  Future getDetails(String imageId) async {
    setState(ViewState.Busy);
    user = await _api.getUser(imageId);
    setState(ViewState.Idle);
    return user;
  }
}
