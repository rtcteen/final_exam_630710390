import 'package:flutter/material.dart';
import 'profile.dart';  // นำเข้า ProfileCard widget ที่ใช้แสดงข้อมูลโปรไฟล์

class HomePage extends StatelessWidget {
  final VoidCallback toggleTheme; //ตัวแปรสำหรับฟังก์ชันเปลี่ยนธีม (โหมดมืดและโหมดปกติ)
  final ThemeMode themeMode; //ตัวแปรสำหรับรับค่าโหมดธีมปัจจุบัน

  // คอนสตรัคเตอร์ของ HomePage รับค่า toggleTheme และ themeMode จากภายนอก
  const HomePage({
    super.key,
    required this.toggleTheme,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark; // ตรวจสอบโหมดธีมปัจจุบัน
    return Scaffold(
      // Scaffold ใช้สร้างโครงสร้างหน้าจอ รวมถึง AppBar และ Body
      // เปลี่ยนสีพื้นหลังของ Scaffold ตามโหมดธีม
      backgroundColor: isDarkMode ? Colors.black : Color.fromARGB(255, 244, 226, 250),  // สีพื้นหลังตามโหมด
      appBar: AppBar(
        title: const Text('Ready for exam'),
        backgroundColor:  isDarkMode ? const Color.fromARGB(255, 90, 87, 87) : const Color.fromARGB(255, 236, 175, 254),
        actions: [ // เพิ่มปุ่มใน AppBar สำหรับสลับโหมด
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.light  
                  ? Icons.dark_mode  // ถ้าเป็นโหมด light ให้แสดงไอคอน dark_mode
                  : Icons.light_mode,  // ถ้าเป็นโหมด dark ให้แสดงไอคอน light_mode
            ),
            onPressed: toggleTheme, // กดปุ่มเพื่อเรียกฟังก์ชัน toggleTheme เปลี่ยนโหมด
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),  // เพิ่มพื้นที่รอบๆ สำหรับการจัดรูปแบบ
        child: Center(
          child: ProfileCard(
            // ใช้ ProfileCard widget สำหรับแสดงข้อมูลของผู้ใช้
            name: 'Ruthaichanok ',
            position: 'Student',
            email: 'reungthanoo_r@silpakorn.edu',
            phoneNumber: '0987654321',
            imageUrl: 'assets/images/nong6.jpg',  // รูปภาพโปรไฟล์
            gitHub: 'https://github.com/rtcteen',  
          ),
        ),
      ),
    );
  }
}
