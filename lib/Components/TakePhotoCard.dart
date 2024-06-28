import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Takephotocard extends StatelessWidget {
  final Widget imagePreview;
  final Widget kirimButton;
  final String photoType;
  final VoidCallback onTakePhoto;

  Takephotocard({
    required this.imagePreview,
    required this.photoType,
    required this.onTakePhoto,
    required this.kirimButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0), // Margin luar container
      padding: EdgeInsets.all(12.0), // Padding dalam container
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Mengubah posisi bayangan
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                photoType,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton.icon(
                onPressed: onTakePhoto,
                icon: Icon(Icons.camera_alt),
                label: Text('Foto'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Background color
                  foregroundColor: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Container(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: imagePreview,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          kirimButton
        ],
      ),
    );
  }
}
