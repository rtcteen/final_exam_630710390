import 'package:flutter/material.dart';

class Answer2 extends StatefulWidget {
  const Answer2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Answer2State createState() => _Answer2State();
}

class _Answer2State extends State<Answer2> {
  final _formKey = GlobalKey<FormState>();  // ใช้ GlobalKey เพื่อตรวจสอบสถานะของฟอร์ม
  final TextEditingController _weightController = TextEditingController();  
  String? _time;  
  String? _selectedWhere;  
  bool _isChecked = false;  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('คำนวณค่าจัดส่ง')),  // แสดงแถบหัวข้อ
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // กำหนดระยะห่างรอบๆ ฟอร์ม
        child: Form(
          key: _formKey,  // กำหนด key ให้ฟอร์ม
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,  // จัดเรียงเนื้อหาไปทางซ้าย
            children: [
              TextFormField(
                controller: _weightController,  // ผูกค่ากับตัวแปร _nameController
                decoration: InputDecoration(labelText: 'น้ำหนังสินค้า (กก.):'),  // กำหนดป้ายกำกับ
                validator: (value) {  // ตรวจสอบค่าก่อน submit
                  if (value == null || value.isEmpty) {
                    return 'โปรดกรอกน้ำหนังสินค้า';  // แจ้งเตือนหากเว้นว่าง
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'เลือกระยะทาง:'),  // ป้ายกำกับ
                value: _selectedWhere,  // ค่าที่เลือก
                items: ['ในเมือง', 'ต่างจังหวัด', 'ต่างประเทศ']  // รายการจังหวัด
                    .map((province) => DropdownMenuItem(
                          value: province,
                          child: Text(province),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedWhere = value;  // อัพเดตค่าที่เลือก
                  });
                },
                validator: (value) => value == null ? 'โปรดเลือกระยะทาง' : null,  // ตรวจสอบว่ามีการเลือกหรือไม่
              ),
              // Checkbox สำหรับยอมรับเงื่อนไข
              CheckboxListTile(
                title: Text('แพ็คกิ้งพิเศษ (+20 บาท)'),  // ข้อความเงื่อนไข
                value: _isChecked,  // ค่าที่เลือก
                onChanged: (value) {
                  setState(() {
                    _isChecked = value!;  // อัพเดตค่าตามที่เลือก
                  });
                },
              ),
              CheckboxListTile(
                title: Text('ประกันพัสดุ (+50 บาท)'),  // ข้อความเงื่อนไข
                value: _isChecked,  // ค่าที่เลือก
                onChanged: (value) {
                  setState(() {
                    _isChecked = value!;  // อัพเดตค่าตามที่เลือก
                  });
                },
              ),
              // (Radio Button)
              Column(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text('ปกติ'),  // ตัวเลือก "Male"
                      value: 'ปกติ',  // กำหนดค่าเมื่อเลือก
                      groupValue: _time,  // เชื่อมค่ากับตัวแปร _gender
                      onChanged: (value) {
                        setState(() {
                          _time = value.toString();  // อัพเดตค่าที่เลือก
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text('ด่วน'),  // ตัวเลือก "Female"
                      value: 'ด่วน',  // กำหนดค่าเมื่อเลือก
                      groupValue: _time,  // เชื่อมค่ากับตัวแปร _gender
                      onChanged: (value) {
                        setState(() {
                          _time = value.toString();  // อัพเดตค่าที่เลือก
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text('ด่วนพิเศษ'),  // ตัวเลือก "Female"
                      value: 'ด่วนพิเศษ',  // กำหนดค่าเมื่อเลือก
                      groupValue: _time,  // เชื่อมค่ากับตัวแปร _gender
                      onChanged: (value) {
                        setState(() {
                          _time = value.toString();  // อัพเดตค่าที่เลือก
                        });
                      },
                    ),
                  ),
                ],
              ),
              
              // ปุ่ม Submit
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // ตรวจสอบว่าฟอร์มถูกต้องและ Checkbox ถูกเลือกหรือไม่
                    if (_formKey.currentState!.validate() && _isChecked) {
                      // ignore: avoid_print
                      print('Form Submitted');  // แสดงข้อความเมื่อกดส่ง
                    }
                  },
                  child: Text('คำนวณราคา'),  // ข้อความบนปุ่ม
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
