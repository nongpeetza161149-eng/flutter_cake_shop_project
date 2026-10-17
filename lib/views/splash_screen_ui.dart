import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cake_shop_list_ui.dart';

class SplashScreenUI extends StatelessWidget {
  const SplashScreenUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.55,
            child: Container(
              color: Colors.pink[50],
              child: const Icon(Icons.cake, size: 100, color: Colors.pink),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0), // แก้ไขจุดที่เขียนผิดตรงนี้เรียบร้อยครับ
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'สายด่วนกินเค้ก',
                      style: GoogleFonts.kanit(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[700],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'CAKE CALL FAST',
                      style: GoogleFonts.kanit(
                        fontSize: 16,
                        letterSpacing: 2,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const CakeShopListUI()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black54, width: 2),
                        ),
                        child: const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
