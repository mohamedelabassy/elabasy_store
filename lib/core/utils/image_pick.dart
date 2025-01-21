import 'package:elabasy_store/core/di/injecttion_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PickImageUtils {
  factory PickImageUtils() {
    return _instance;
  }
  const PickImageUtils._();
  static const PickImageUtils _instance = PickImageUtils._();

  Future<XFile?> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image != null) {
        return XFile(image.path);
      }
      return null;
    } catch (e) {
      final permissionStatus = await Permission.photos.status;
      if (permissionStatus.isGranted) {
        await _showAlertPermissionsDialog();
      } else {
        debugPrint("Image Error: =>>$e");
      }
    }
    return null;
  }

  Future<void> _showAlertPermissionsDialog() {
    return showCupertinoDialog(
        context: sl<GlobalKey<NavigatorState>>().currentState!.context,
        builder: (builder) {
          return const CupertinoAlertDialog(
            title: Text('Permissions Needed'),
            content: Text(
              'allow acess to gallery and photos',
            ),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: openAppSettings,
                child: Text('Settings'),
              ),
            ],
          );
        });
  }
}
