import 'package:carbranding_apps/Components/TakePhotoCard.dart';
import 'package:carbranding_apps/Components/photoInfoCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TambahLaporanView extends StatelessWidget {
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
                    height: 100,
                    width: 1.sw,
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          height: 100,
                          width: 1.sh,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              image: DecorationImage(
                                image: AssetImage('assets/background.jpg'),
                                fit: BoxFit
                                    .cover, // Menyesuaikan ukuran gambar sesuai dengan ukuran container
                              )),
                        ),
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
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      )),
                                  Text(
                                    "Tambahkan Laporan",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
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
                                  Text(
                                    "UNS Campus ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Sampai tanggal 20 Juni 2024",
                                    style: TextStyle(fontSize: 10.sp),
                                  ),
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
                      "Ambil Foto Sesuai dengan Jenis Foto",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Takephotocard(
                      imagePath: 'assets/background.jpg',
                      // Ganti dengan path gambar Anda
                      photoType: 'Speedometer',
                      onTakePhoto: () {
                        print('Ambil Foto button pressed');
                      },
                    ),
                    Takephotocard(
                      imagePath: 'assets/background.jpg',
                      // Ganti dengan path gambar Anda
                      photoType: 'Stiker Belakang',
                      onTakePhoto: () {
                        print('Ambil Foto button pressed');
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
