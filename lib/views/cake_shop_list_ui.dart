import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cake_shop_detail_ui.dart';

class CakeShopListUI extends StatelessWidget {
  const CakeShopListUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 🍰 อัปเดตรายการเมนูเค้กและขนมหวานยอดนิยมตามภาพจริงของคุณ
    List<Map<String, dynamic>> cakes = [
      {
        'name': 'Strawberry Daifuku & Soft Cake', 
        'shop': 'The.earlybake', 
        'price': '฿95.-', 
        'phone': '085-482-2842',
        'icon': Icons.icecream_rounded,
        'color': Colors.pink.shade300
      },
      {
        'name': 'Premium Soft Cookies (Heart Shape)', 
        'shop': 'Feelin.doughgood', 
        'price': '฿79.-', 
        'phone': '084-666-6828',
        'icon': Icons.cookie_rounded,
        'color': Colors.amber.shade700
      },
      {
        'name': 'Luxury Strawberry Birthday Cake', 
        'shop': 'C Belly', 
        'price': '฿550.-', 
        'phone': '02-254-8100',
        'icon': Icons.cake_rounded,
        'color': Colors.red.shade400
      },
      {
        'name': 'Fresh Fruit Minimalist Tart', 
        'shop': 'The Story Caker', 
        'price': '฿420.-', 
        'phone': '093-449-9447',
        'icon': Icons.bakery_dining_rounded,
        'color': Colors.orange.shade400
      },
      {
        'name': 'Custom Anniversary Lettering Pie', 
        'shop': 'Aob Auan', 
        'price': '฿380.-', 
        'phone': '02-610-9702',
        'icon': Icons.pie_chart_rounded,
        'color': Colors.purple.shade300
      },
      {
        'name': 'Premium Chocolate & Flower Box', 
        'shop': 'SamSuan', 
        'price': '฿690.-', 
        'phone': '02-321-5995',
        'icon': Icons.card_giftcard_rounded,
        'color': Colors.brown.shade400
      },
      {
        'name': 'Velvet Flower & Soft Fudge Cake', 
        'shop': 'Cafe De Tu', 
        'price': '฿120.-', 
        'phone': '02-555-1234',
        'icon': Icons.breakfast_dining_rounded,
        'color': Colors.teal.shade300
      },
      {
        'name': 'Assorted Homemade Cake Box', 
        'shop': 'Yellow Spoon Pastry', 
        'price': '฿450.-', 
        'phone': '085-482-2842',
        'icon': Icons.breakfast_dining_outlined,
        'color': Colors.amber.shade500
      },
    ];

    List<Map<String, dynamic>> categories = [
      {'name': 'ขนมหวานแนะนำทั้งหมด', 'icon': Icons.bakery_dining_rounded},
      {'name': 'เค้กวันเกิด', 'icon': Icons.cake_rounded},
      {'name': 'ไดฟูกุ', 'icon': Icons.icecream_rounded},
      {'name': 'คุกกี้ & ทาร์ต', 'icon': Icons.cookie_rounded},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFCF9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5964),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'สายด่วนกินเค้ก 🍰',
          style: GoogleFonts.kanit(
            color: Colors.white, 
            fontWeight: FontWeight.bold, 
            fontSize: 22,
            letterSpacing: 1.2
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          // 🧁 ส่วนแบนเนอร์ไล่เฉดสีชมพูพาสเทลหรูหรา
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFFF0F2), Color(0xFFFFD6DC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFD6DC).withOpacity(0.6),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                )
              ]
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -10,
                  bottom: -10,
                  child: Icon(
                    Icons.bakery_dining_rounded,
                    size: 130,
                    color: const Color(0xFFFF5964).withOpacity(0.08),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Premium Dessert Market',
                        style: GoogleFonts.kanit(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF4A2C2A),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'รวมเมนูเบเกอรี่โฮมเมดและเค้กพรีเมียมจากร้านดัง',
                        style: GoogleFonts.kanit(
                          fontSize: 13,
                          color: const Color(0xFF7D5A57),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          // แถบหมวดหมู่ของหวานแนวนอน
          SizedBox(
            height: 38,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                bool isFirst = index == 0;
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: isFirst ? const Color(0xFFFF5964) : Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFFFE3E7), width: 1),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        categories[index]['icon'],
                        size: 16,
                        color: isFirst ? Colors.white : const Color(0xFFFF5964),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        categories[index]['name'],
                        style: GoogleFonts.kanit(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: isFirst ? Colors.white : const Color(0xFF4A2C2A),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          // 🍫 ส่วนแสดงผลรายการของหวานแบบกล่องกราฟิกสีสันสดใส
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              itemCount: cakes.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF4A2C2A).withOpacity(0.03),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF0F2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      // ใช้กราฟิกดีไซน์สีพาสเทลเพื่อความสวยงาม ปลอดภัยบน Chrome Web Browser
                      child: Center(
                        child: Icon(
                          cakes[index]['icon'] as IconData,
                          color: cakes[index]['color'] as Color,
                          size: 32,
                        ),
                      ),
                    ),
                    title: Text(
                      cakes[index]['name'] as String,
                      style: GoogleFonts.kanit(
                        fontWeight: FontWeight.bold, 
                        fontSize: 15, 
                        color: const Color(0xFF332221)
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'แบรนด์: ${cakes[index]['shop']}',
                            style: GoogleFonts.kanit(color: Colors.grey.shade600, fontSize: 12),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const Icon(Icons.phone_in_talk_rounded, size: 12, color: Color(0xFFFF5964)),
                              const SizedBox(width: 4),
                              Text(
                                cakes[index]['phone'] as String,
style: GoogleFonts.kanit(
color: const Color(0xFFFF5964),
fontWeight: FontWeight.w500,
fontSize: 12
),
),
],
),
],
),
),
trailing: Row(
mainAxisSize: MainAxisSize.min,
children: [
Text(
cakes[index]['price'] as String,
style: GoogleFonts.kanit(
color: const Color(0xFFFF5964),
fontWeight: FontWeight.bold,
fontSize: 15,
),
),
const SizedBox(width: 8),
Container(
width: 32,
height: 32,
decoration: const BoxDecoration(color: Color(0xFFFFF0F2), shape: BoxShape.circle),
child: const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFFFF5964), size: 12),
),
],
),
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => CakeShopDetailUI(
shopName: cakes[index]['shop'] as String,
phone: cakes[index]['phone'] as String
),
),
);
},
),
);
},
),
),
],
),
);
}
}