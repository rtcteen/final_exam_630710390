import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileCard extends StatelessWidget {
  // ตัวแปรที่รับค่าข้อมูลต่างๆ ที่จะแสดงในการ์ดโปรไฟล์
  final String name;
  final String position;
  final String email;
  final String phoneNumber;
  final String imageUrl;  // URL ของรูปภาพโปรไฟล์
  final String gitHub;

  // คอนสตรัคเตอร์ของ ProfileCard ที่รับค่าต่างๆ จากภายนอก
  const ProfileCard({
    super.key,
    required this.name,
    required this.position,
    required this.email,
    required this.phoneNumber,
    required this.imageUrl,
    required this.gitHub,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;  // ตรวจสอบว่าโหมดปัจจุบันเป็นโหมดมืดหรือไม่

    // สร้าง Card ที่มีขอบมนและสีพื้นหลังที่แตกต่างตามโหมด
    return Center(
      child: Card(
        elevation: 4,  // ความสูงของเงา
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),  // มุมที่โค้งมน
        ),
        // เปลี่ยนสีของการ์ดตามโหมด (มืดหรือสว่าง)
        color: isDarkMode ? Colors.grey[800] : Color.fromARGB(255, 255, 255, 207), //เปลี่ยนสี Card ตามโหมด
        child: Padding(
          padding: const EdgeInsets.all(16.0),  // ระยะห่างจากขอบการ์ด
          child: Column(
            mainAxisSize: MainAxisSize.min,  // ให้คอลัมน์ยืดขนาดตามขนาดเนื้อหา
            children: [
              // แสดงรูปโปรไฟล์ในรูปแบบวงกลม
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(imageUrl),  // รูปภาพโปรไฟล์
              ),
              const SizedBox(height: 12),  // เว้นช่องว่างระหว่างรูปภาพและข้อความ
              // แสดงชื่อผู้ใช้
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,  // ขนาดตัวอักษร
                  fontWeight: FontWeight.bold,  // หนาขึ้น
                ),
              ),
              // แสดงตำแหน่ง และเปลี่ยนสีข้อความตามโหมด
              Text(position, style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.grey)), //เปลี่ยนสีข้อความ
              //const SizedBox(height: 8),  // เว้นช่องว่างระหว่างตำแหน่งและข้อมูลอื่นๆ
              Divider(  //เส้น
                color: Colors.grey, // กำหนดสีเส้น
                thickness: 1, // กำหนดความหนาของเส้น
                height: 20, // กำหนดความสูงของพื้นที่ที่ Divider ครอบคลุม
              ),
              // แสดงข้อมูลอีเมล
              Row(
                mainAxisAlignment: MainAxisAlignment.center,  // จัดตำแหน่งให้กลาง
                children: [
                  // แสดงไอคอนอีเมล
                  Icon(Icons.email, size: 16, color: isDarkMode ? Colors.tealAccent : Colors.blue), //เปลี่ยนสีไอคอน
                  const SizedBox(width: 4),  // เว้นช่องว่างระหว่างไอคอนและข้อความ
                  // แสดงอีเมล
                  Text(email, style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)), //เปลี่ยนสีข้อความ
                ],
              ),
              const SizedBox(height: 4),  // เว้นช่องว่างระหว่างข้อมูลอีเมลและข้อมูลโทรศัพท์
              // แสดงข้อมูลเบอร์โทรศัพท์
              Row(
                mainAxisAlignment: MainAxisAlignment.center,  // จัดตำแหน่งให้กลาง
                children: [
                  // แสดงไอคอนโทรศัพท์
                  Icon(Icons.phone, size: 16, color: isDarkMode ? Colors.greenAccent : Colors.green), //เปลี่ยนสีไอคอน
                  const SizedBox(width: 4),  // เว้นช่องว่างระหว่างไอคอนและข้อความ
                  // แสดงเบอร์โทร
                  Text(phoneNumber, style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)), //เปลี่ยนสีข้อความ
                ],
              ),
              const SizedBox(height: 4),  // เว้นช่องว่างระหว่างข้อมูลอีเมลและข้อมูลโทรศัพท์
              // แสดงข้อมูล GitHub
              Row(
                mainAxisAlignment: MainAxisAlignment.center,  // จัดตำแหน่งให้กลาง
                children: [
                  // แสดงไอคอน GitHub
                  Icon(FontAwesomeIcons.github, size: 24, color: isDarkMode ? Colors.white : Colors.black), //เปลี่ยนสีไอคอน
                  const SizedBox(width: 4),  // เว้นช่องว่างระหว่างไอคอนและข้อความ
                  // แสดงลิงค์
                  Text(gitHub, style: TextStyle(color: isDarkMode ? Colors.black : Colors.black)), //เปลี่ยนสีข้อความ
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
