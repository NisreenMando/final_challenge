import 'package:bot_toast/bot_toast.dart';
import 'package:fluter_template/ui/shared/utils.dart';

import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;

//استدعاء عند login//
//three story//

class LocationService {
  Location location = Location();
  //getUserCurrentLocation =>نختبر اذا المستخدم عطا صلاحية واذن عالموقع
  Future<LocationData?> getUserCurrentLocation({bool hideLoader = true}) async {
    LocationData _locationData;
    //اذا مانها مفعلة بوقف معد يقدر ينفذ //
    if (!await isLocationEnabeld()) return null;
    // اعطاء صلاحية على الموقع
    if (!await isPermissionGranted()) return null;
    //CustomLoader =>fullLoading بيقفل كل الواجهة//

    CustomLoader();

    _locationData = await location.getLocation();

    if (hideLoader) BotToast.closeAllLoading();

    return _locationData;
    //_locationData=>lat&long//
  }

  Future<geo.Placemark?> getAddressInfo(LocationData locationData,
      {bool showLoader = true}) async {
    if (showLoader) CustomLoader();
    List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        locationData.latitude ?? 0.0, locationData.longitude ?? 0.0);
    BotToast.closeAllLoading();
    if (placemarks.isNotEmpty) {
      return placemarks[0];
    } else {
      return null;
    }
  }

//??
  Future<geo.Placemark?> getCurrentAddressInfo() async {
    return await getAddressInfo(
        await getUserCurrentLocation(hideLoader: false) ??
            LocationData.fromMap({}),
        showLoader: false);
  }

//yes
  Future<bool> isLocationEnabeld() async {
    bool _serviceEnabled;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        //!-- Message to show --
        //ممكن نطلع dialoge//
        return false;
      }
    }
    return _serviceEnabled;
  }

//yes
  Future<bool> isPermissionGranted() async {
    PermissionStatus _permissionGranted;

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        //!-- Message to show --
        return false;
      }
    }
    //اذا مانه ممنوح  ما رح اقدر وصل للموقع //
    return _permissionGranted == PermissionStatus.granted;
  }
}
