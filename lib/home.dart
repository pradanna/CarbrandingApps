import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove the default appBar and set a transparent status bar
      extendBodyBehindAppBar: true,

      body: Stack(
        children: [
          // Background image
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.52,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Centered text on the background image
          buildDriverCard(driverName: "Pradana", carNumber: "AD 0024 KK", carType: "Calya Yellow", status: "Iklan Campus"),
          // Draggable scrollable sheet at the bottom
          DraggableScrollableSheet(
            initialChildSize: 0.52, // Initial size of the sheet relative to screen height
            minChildSize: 0.52, // Minimum size of the sheet relative to screen height
            maxChildSize: 0.8, // Maximum size of the sheet relative to screen height
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 50,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Your Content Here',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec velit sit amet ante luctus malesuada. Sed venenatis magna eget lacus varius, non accumsan urna feugiat. Donec nec felis vitae velit volutpat tempor. Nullam ullamcorper libero eu orci laoreet, at ultricies eros maximus. Duis tristique purus eget turpis congue, nec tincidunt nulla eleifend.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        // Add your additional widgets here
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


Widget buildDriverCard({
  required String driverName,
  required String carNumber,
  required String carType,
  required String status,
}) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Container(
      padding: const EdgeInsets.all(16.0),
      margin: EdgeInsets.all(16),
      width: 0.8.sw,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Driver Name:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            driverName,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Car Number:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            carNumber,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Car Type:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            carType,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Status:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            status,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
