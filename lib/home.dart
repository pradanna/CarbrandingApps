import 'package:carbranding_apps/Components/helper/date_time_helper.dart';
import 'package:carbranding_apps/Components/photoInfoCard.dart';
import 'package:carbranding_apps/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: 1.sh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 300,
                    width: 1.sw,
                    child: Stack(
                      children: [
                        Container(
                            padding: EdgeInsets.all(16),
                            height: 250,
                            width: 1.sh,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                image: DecorationImage(
                                  image: AssetImage('assets/background.jpg'),
                                  fit: BoxFit
                                      .cover, // Menyesuaikan ukuran gambar sesuai dengan ukuran container
                                )),
                            child: Obx(
                              () => controller.isLoading.value
                                  ? Center(child: CircularProgressIndicator())
                                  : Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            controller.profileData['data']
                                                ['name'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w900)),
                                        Text(
                                          controller.profileData['data']
                                                  ['car_type']['name'] +
                                              " | " +
                                              controller.profileData['data']
                                                  ['vehicle_id'],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 50,
                                        )
                                      ],
                                    ),
                            )),
                        Positioned(
                            top: 20,
                            child: Container(
                              padding: EdgeInsets.all(24),
                              width: 1.sw,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset('assets/seelogo.png')),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed("/profile");
                                    },
                                    child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Image.asset('assets/user.png')),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                  Positioned(
                    top: 200,
                    child: Container(
                      width: 1.sw,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 0.8.sw,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(3, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Container(
                            height: double.infinity,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Iklan yang sedang aktif"),
                                  Obx(
                                    () => controller.isLoading.value
                                        ? Center(
                                            child: CircularProgressIndicator())
                                        : Text(
                                            controller.profileData['data']
                                                ['broadcast_name'],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ),
                                  // Text(
                                  //   "Sampai tanggal 20 Juni 2024",
                                  //   style: TextStyle(fontSize: 10.sp),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(
                      "Daftar Foto Laporan Anda",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Obx(
                      () => controller.isLoadingReport.value
                          ? Center(child: CircularProgressIndicator())
                          : Column(
                              children: controller.reports
                                  .map((report) => PhotoInfoCard(
                                        photoPath:
                                            "https://carbranding.genossys.com" +
                                                report['image'],
                                        // Ganti dengan path gambar dari API
                                        photoType:
                                            report['type'] ?? 'Jenis Foto',
                                        date: DateTimeHelper
                                                .formatDateTimeFromString(
                                                    report['created_at']) ??
                                            'Tanggal',
                                        location: report['location'] ?? '',
                                      ))
                                  .toList(),
                            ),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed("/chooseReport");
          // Tambahkan aksi yang ingin dilakukan saat tombol ditekan
          print('Floating Action Button Pressed s');
        },
        icon: Icon(Icons.add),
        label: Text('Tambahkan Laporan'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
