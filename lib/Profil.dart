import 'package:carbranding_apps/controller/profileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileView extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  void logout() {
    GetStorage().erase(); // Clear all stored data
    Get.offAllNamed('/login'); // Navigate to login page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(controller.profileData['name'] ?? ''),
                    SizedBox(height: 16),
                    Text('Nomor Polisi',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(controller.profileData['vehicle_id'] ?? ''),
                    SizedBox(height: 16),
                    Text('Jenis Mobil',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(controller.profileData['car_type']['name'] ?? ''),
                    SizedBox(height: 16),
                    Text('Nomor Rekening',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(controller.profileData['account_number'] ?? ''),
                    SizedBox(height: 16),
                    Text('Bank Rekening',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(controller.profileData['bank'] ?? ''),
                    SizedBox(height: 16),
                    Divider(),
                    SizedBox(height: 16),
                    Text('Ganti Password',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    TextField(
                      onChanged: (value) =>
                          controller.newPassword.value = value,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      onChanged: (value) =>
                          controller.repeatPassword.value = value,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Repeat Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: controller.updatePassword,
                      child: Text('Update Password'),
                    ),
                    SizedBox(height: 16),
                    Divider(),
                    SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: logout,
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.red),
                        child: Text('Logout'),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
