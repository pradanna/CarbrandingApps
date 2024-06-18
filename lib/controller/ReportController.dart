import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ReportController extends GetxController {
  final Dio.Dio dio = Dio.Dio();
  GetStorage box = GetStorage();

  Future<void> sendReport(
      String type, String lat, String lng, String imagePath) async {
    try {
      String fileName = imagePath.split('/').last;
      var token = await box.read("token");

      var formData = Dio.FormData.fromMap({
        'type': type,
        'latitude': lat,
        'longitude': lng,
        'image':
            await Dio.MultipartFile.fromFile(imagePath, filename: fileName),
      });

      final response = await dio.post(
          'https://carbranding.genossys.com/driver/report',
          data: formData,
          options: Dio.Options(headers: {'Authorization': 'Bearer $token'}));

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Report sent successfully');
      } else {
        Get.snackbar('Error', 'Failed to send report');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      print('ERROR SENDDATA ' + e.toString());
    }
  }
}
