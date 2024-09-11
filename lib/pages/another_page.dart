import 'package:flutter/material.dart';
import 'package:labshared_pref/pages/first_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key});

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  // Declare your variable for data
  String? myname;

  // Declare your function to load data
  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myname = prefs.getString("myName");
    });
  }

  void removeData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("myName");
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Another Page"),
        backgroundColor: Colors.teal, // เปลี่ยนสี AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'), // ใช้ภาพพื้นหลังที่มีอยู่ในโฟลเดอร์ assets
            fit: BoxFit.cover, // ให้ภาพปกคลุมทั้งพื้นหลัง
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0), // เพิ่ม Padding รอบๆ
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่ตรงกลางในแนวตั้ง
                crossAxisAlignment: CrossAxisAlignment.center, // จัดให้อยู่ตรงกลางในแนวนอน
                children: [
                  // Show Your name
                  Text(
                    myname ?? "รอสักครู่",
                    style: TextStyle(
                      fontSize: 30,
                      color: const Color.fromARGB(255, 18, 255, 204), // สีข้อความเพื่อให้ตัดกับพื้นหลัง
                      fontWeight: FontWeight.bold, // เพิ่มความหนา
                    ),
                    textAlign: TextAlign.center, // จัดตำแหน่งข้อความให้ตรงกลาง
                  ),
                  SizedBox(height: 40), // เพิ่มพื้นที่ว่าง
                  // Button go to Home Page
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal, // เปลี่ยนสีพื้นหลังปุ่ม
                      foregroundColor: Colors.white, // เปลี่ยนสีข้อความในปุ่ม
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // ปรับความโค้งมุม
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // เพิ่ม Padding ภายในปุ่ม
                      elevation: 5, // เพิ่มเงาให้ปุ่ม
                    ),
                    child: Text(
                      'ย้อนกลับ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold, // เพิ่มความหนา
                      ),
                    ),
                  ),
                  SizedBox(height: 16), // เพิ่มพื้นที่ว่างระหว่างปุ่ม
                  // Button go to First Page
                  ElevatedButton(
                    onPressed: () {
                      removeData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FirstPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal, // เปลี่ยนสีพื้นหลังปุ่ม
                      foregroundColor: Colors.white, // เปลี่ยนสีข้อความในปุ่ม
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // ปรับความโค้งมุม
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // เพิ่ม Padding ภายในปุ่ม
                      elevation: 5, // เพิ่มเงาให้ปุ่ม
                    ),
                    child: Text(
                      'หน้าแรก',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold, // เพิ่มความหนา
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
