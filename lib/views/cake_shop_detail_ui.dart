import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
 
class CakeShopDetailUI extends StatelessWidget {
  final String shopName;
  final String phone;
 
  const CakeShopDetailUI({Key? key, required this.shopName, required this.phone}) : super(key: key);
 
  Future<void> _openUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('เปิดลิงก์ไม่ได้: $url')),
      );
    }
  }
 
  Future<void> _callPhone(BuildContext context, String phone) async {
    final uri = Uri(scheme: 'tel', path: phone.replaceAll('-', ''));
    final ok = await launchUrl(uri);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('โทรไม่ได้: $phone')),
      );
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(shopName, style: GoogleFonts.kanit(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.store, size: 64, color: Colors.grey.shade400),
                  const SizedBox(height: 8),
                  Text('รูปภาพร้านค้า', style: GoogleFonts.kanit(color: Colors.grey.shade500)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ชื่อร้าน', style: GoogleFonts.kanit(fontSize: 14, color: Colors.grey)),
                  Text(shopName, style: GoogleFonts.kanit(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text('เวลาเปิดปิด', style: GoogleFonts.kanit(fontSize: 14, color: Colors.grey)),
                  Text('ทุกวัน 09:00 - 21:00 น.', style: GoogleFonts.kanit(fontSize: 16)),
                  const SizedBox(height: 12),
                  Text('รายละเอียดแนะนำร้าน', style: GoogleFonts.kanit(fontSize: 14, color: Colors.grey)),
                  Text(
                    'สำหรับคนรักช็อกโกแลต ต้องนึกถึงร้าน $shopName เพราะเป็นร้านแรกๆ ที่นำเมนูเค้กช็อกโกแลตหน้านิ่มเข้ามาเปิดตัว ได้รับความนิยมและส่งต่อความอร่อยมายาวนานกว่า 20 ปี สินค้าทุกชิ้นคัดสรรวัตถุดิบพรีเมียม สดใหม่ สะอาด ชวนให้เคี้ยวฟินละมุนทุกคำ',
                    style: GoogleFonts.kanit(fontSize: 15, height: 1.5),
                  ),
                  const SizedBox(height: 16),
                  Text('ที่อยู่ของร้าน', style: GoogleFonts.kanit(fontSize: 14, color: Colors.grey)),
                  Text('ถ. พุทธมณฑลสาย 3', style: GoogleFonts.kanit(fontSize: 16)),
                  const SizedBox(height: 24),
                  Center(
                    child: SizedBox(
                      width: 180,
                      height: 48,
                      child: ElevatedButton.icon(
                        onPressed: () => _callPhone(context, phone),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        ),
                        icon: const Icon(Icons.phone, color: Colors.white),
                        label: Text(phone, style: GoogleFonts.kanit(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    onTap: () => _openUrl(context, 'https://larnahouse.com'),
                    leading: const Icon(Icons.language, color: Colors.amber),
                    title: Text('https://larnahouse.com', style: GoogleFonts.kanit(color: Colors.blue)),
                    trailing: const Icon(Icons.link, color: Colors.grey),
                  ),
                  ListTile(
                    onTap: () => _openUrl(context, 'https://facebook.com'),
                    leading: const Icon(Icons.facebook, color: Colors.blue),
                    title: Text('https://facebook.com', style: GoogleFonts.kanit(color: Colors.blue), maxLines: 1, overflow: TextOverflow.ellipsis),
                    trailing: const Icon(Icons.link, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  Text('แผนที่', style: GoogleFonts.kanit(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              color: const Color(0xFF1A2238),
                              child: CustomPaint(
                                painter: PhutthamonthonMapPainter(),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 80,
                            right: 100,
                            child: Row(
                              children: [
                                const Icon(Icons.icecream, color: Colors.pinkAccent, size: 24),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(8)),
                                  child: const Text('4.9', style: TextStyle(color: Colors.white, fontSize: 12)),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 100,
                            left: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.restaurant, color: Colors.orange, size: 24),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(8)),
                                      child: const Text('4.1', style: TextStyle(color: Colors.white, fontSize: 12)),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'บ้านขนม นฤมล สาย 3',
                                  style: GoogleFonts.kanit(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 
class PhutthamonthonMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var roadPaint = Paint()
      ..color = const Color(0xFF2C3E50)
      ..strokeWidth = 24.0
      ..style = PaintingStyle.stroke;
 
    canvas.drawLine(Offset(size.width * 0.2, 0), Offset(size.width * 0.2, size.height), roadPaint);
 
    var branchPaint = Paint()
      ..color = const Color(0xFF2C3E50)
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke;
 
    var path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.45);
    path.lineTo(size.width * 0.9, size.height * 0.42);
    path.moveTo(size.width * 0.6, size.height * 0.43);
    path.lineTo(size.width * 0.6, size.height * 0.25);
 
    canvas.drawPath(path, branchPaint);
  }
 
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}