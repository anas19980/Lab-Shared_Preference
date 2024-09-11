import 'package:flutter/material.dart';
import 'package:labshared_pref/pages/another_page.dart'; // ตรวจสอบให้แน่ใจว่าเส้นทางถูกต้อง
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Declare your variable for data
  String? myname;

  // Declare your function to load data
  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myname = prefs.getString("myName");
    });
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
        title: const Text("Home Page"),
        backgroundColor: Colors.teal, // เปลี่ยนสี AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0), // เพิ่ม Padding รอบๆ
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่ตรงกลาง
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Show Your name
                  Text(
                    myname ?? "รอสักครู่",
                    style: TextStyle(
                      fontSize: 30,
                      color: const Color.fromARGB(255, 33, 243, 156),
                      fontWeight: FontWeight.bold, // เพิ่มความหนา
                    ),
                  ),
                  SizedBox(height: 40), // เพิ่มพื้นที่ว่าง
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AnotherPage()), // ตรวจสอบชื่อคลาส
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
                      'ถัดไป',
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
