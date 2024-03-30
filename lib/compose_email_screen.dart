import 'package:flutter/material.dart';
import 'package:Mailbox/data.dart';

class ComposeScreen extends StatelessWidget {
  ComposeScreen({required Key key}) : super(key: key);
  final List<String> menuTabItems = [
    'กำหนดเวลาส่ง',
    "เพิ่มจากรายชื่่อติดต่อ",
    "โหมดข้อมูลลับ",
    "ทิ้ง",
    "การตั้งค่า",
    "ความช่วยเหลือและความคิดเห็น"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 22, 62, 98),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 20,
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'เขียน',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.attachment_outlined),
              iconSize: 20,
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.send),
              iconSize: 20,
              color: Colors.white,
              onPressed: () {},
            ),
            InkWell(
              child: PopupMenuButton(
                iconSize: 20,
                icon: Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                ),
                itemBuilder: (context) => menuTabItems
                    .map(
                      (itemName) => PopupMenuItem(
                        child: Text(itemName),
                        value: itemName,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
        body: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: kPadding - 4),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        top: kPadding - 5,
                        left: kPadding - 5,
                        right: kPadding - 5),
                    child: Text(
                      'จาก',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                  hintText: 'b.biw15138@mailbox.com',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.expand_more),
                    color: Colors.black54,
                    onPressed: () {},
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: kPadding - 4),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        top: kPadding - 5,
                        left: kPadding - 5,
                        right: kPadding - 5),
                    child: Text(
                      'ถึง',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.expand_more),
                    color: Colors.black54,
                    onPressed: () {},
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: kPadding - 10,
                      left: kPadding - 10,
                      right: kPadding - 10),
                  hintText: 'เรื่อง',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: kPadding - 10,
                      left: kPadding - 10,
                      right: kPadding - 10),
                  hintText: 'เขียนอีเมล',
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ));
  }
}
