import 'package:flutter/material.dart';

class Answer1 extends StatelessWidget {
  const Answer1({super.key});
  
  String get imageUrl => 'assets/images/nong6.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("โปรไฟล์ผู้ใช้งาน"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imageUrl),  // รูปภาพโปรไฟล์
          ),
          Text(
            "ชื่อผู้ใช้: Ruthaichanok Reungthanoo",
            style: TextStyle(
            //color: Colors.white,
            fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "อีเมล: reungthanoo_r@silpakorn.edu",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: const Icon(
                      Icons.settings,
                      color: Colors.blue,
                    ),
                  ),
                  const Text(
                    "การตั้งค่า",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left:20, right:20),
                    child: const Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),
                  ),
                  const Text(
                    "เปลี่ยนรหัสผ่าน",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left:20, right:20, top:20),
                    child: const Icon(
                      Icons.help,
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text(
                      "ความเป็นส่วนตัว",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                //margin: const EdgeInsets.only(left: 50),
                child: ElevatedButton(
                  onPressed:(){}, 
                  child: const Text('Edit Profile',style: TextStyle(fontSize: 16),)
                ),
              ),
              const SizedBox(height: 5),
              Container(
                alignment: Alignment.bottomCenter,
                //margin: const EdgeInsets.only(right: 50),
                child: ElevatedButton(
                  onPressed:(){}, 
                  child: const Text('Logout',style: TextStyle(fontSize: 16),)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
  