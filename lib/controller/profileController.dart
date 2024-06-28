import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var profileData = {}.obs;
  var newPassword = ''.obs;
  var repeatPassword = ''.obs;
  GetStorage box = GetStorage();
  final Dio _dio = Dio();

  @override
  void onInit() {
    super.onInit();
    fetchProfileData();
  }

  void fetchProfileData() async {
    isLoading(true);
    var token = await box.read("token");
    try {
      final response = await _dio.get(
          'https://carbranding.genossys.com/driver/profile',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200) {
        profileData.value = response.data['data'];
      } else {
        Get.snackbar('Error', 'Failed to fetch profile data');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while fetching profile data');
    } finally {
      isLoading(false);
    }
  }

  void updatePassword() async {
    if (newPassword.value != repeatPassword.value) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    var token = await box.read("token");
    try {
      final response = await _dio.post(
          'https://carbranding.genossys.com/driver/update-password',
          data: {
            'password': newPassword.value,
            'password_confirmation': repeatPassword.value
          },
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Password updated successfully');
      } else {
        Get.snackbar('Error', 'Failed to update password');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while updating password');
    }
  }
}
