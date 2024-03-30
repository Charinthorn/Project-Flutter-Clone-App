import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Mailbox/compose_email_screen.dart';
import 'package:Mailbox/data.dart';
import 'package:Mailbox/mail_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    MySize = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: kPadding),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Mailbox',
                    style: TextStyle(
                      fontSize: kPadding - 2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: kPadding - 10),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(height: kPadding - 15),
                buildDrawerItem(Icons.all_inbox, 'จดหมายทั้งหมด', 0),
                SizedBox(height: kPadding - 15),
                Divider(
                  color: Colors.grey,
                ),
                buildDrawerItem(Icons.inbox, 'หลัก', 1),
                buildDrawerItem(Icons.group_outlined, 'โซเชียล', 2),
                const ListTile(
                  leading: Icon(Icons.discount_outlined, size: 20),
                  title: Text(
                    'โปรโมชัน',
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: Chip(
                      backgroundColor: Color.fromARGB(255, 214, 136, 188),
                      label: Text(
                        "2 ใหม่",
                        style: TextStyle(fontSize: 12),
                      )),
                ),
                const ListTile(
                  leading: Icon(Icons.info_outline, size: 20),
                  title: Text(
                    'อัปเดต',
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: Chip(
                      backgroundColor: Color.fromARGB(255, 95, 175, 225),
                      label: Text(
                        "ใหม่",
                        style: TextStyle(fontSize: 12),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('ป้ายกำกับ',
                      style: TextStyle(
                          fontSize: kPadding - 5, fontWeight: FontWeight.w600)),
                ),
                buildDrawerItem(Icons.star_rate_outlined, 'ติดดาว', 5),
                buildDrawerItem(
                    Icons.history_toggle_off, 'เลื่อนการแจ้งเตือนแล้ว', 6),
                const ListTile(
                  leading: Icon(Icons.label_important, size: 22),
                  title: Text(
                    'สำคัญ',
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: Text(
                    "4",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                buildDrawerItem(Icons.send, 'ส่งแล้ว', 9),
                buildDrawerItem(Icons.drafts, 'ร่างจดหมาย', 7),
                const ListTile(
                  leading: Icon(Icons.mail_outline, size: 20),
                  title: Text(
                    'อีเมลทั้งหมด',
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: Text(
                    "99+",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                buildDrawerItem(Icons.info_rounded, 'จดหมายขยะ', 10),
                buildDrawerItem(Icons.delete_outline, 'ถังขยะ', 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('แอป Google',
                      style: TextStyle(
                          fontSize: kPadding - 5, fontWeight: FontWeight.w600)),
                ),
                buildDrawerItem(Icons.calendar_today, 'ปฏิทิน', 11),
                buildDrawerItem(Icons.contacts, 'รายชื่อติดต่อ', 12),
                Divider(
                  color: Colors.grey,
                ),
                buildDrawerItem(Icons.settings, 'การตั้งค่า', 13),
                buildDrawerItem(
                    Icons.help_outline, 'ความช่วยเหลือและความคิดเห็น', 14),
              ],
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: kPadding - 15),
              //------------Header
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 236, 234, 230),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      color: Color.fromARGB(255, 0, 0, 0),
                      offset: Offset(2, 0),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 24,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'ค้นหาอีเมล',
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            isDense: false,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => buildAccountSetting(),
                        );
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/3.jpg'),
                      ),
                    ),
                    SizedBox(width: kPadding - 5),
                  ],
                ),
              ),
              SizedBox(height: kPadding - 8),
              //------------Heading title
              SizedBox(height: kPadding - 10),
              //------------Content/Mails
              Expanded(
                flex: 1,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: mailList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return MailDetailScreen(
                              heading: mailList[index].description,
                              mail: mailList[index].title,
                              time: mailList[index].time,
                            );
                          },
                        ));
                      },
                      child: MailItemWidget(
                        title: mailList[index].title,
                        description: mailList[index].description,
                        content: mailList[index].content,
                        time: mailList[index].time,
                        isRead: mailList[index].isRead,
                        key: ValueKey(null),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ComposeScreen(
                    key: ValueKey(null),
                  )));
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: kPadding - 8, vertical: kPadding - 12),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 31, 65, 110),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                color: Colors.black,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.edit,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: kPadding - 10),
              Text(
                'เขียน',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAccountSetting() {
    return Dialog(
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: kPadding - 10),
                AccountWidget(
                  name: 'แมวส้ม',
                  mail: 'som@mailbox.com',
                  imgPath: 'assets/images/3.jpg',
                  key: UniqueKey(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: kPadding - 8,
                    vertical: kPadding - 15,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: kPadding,
                    vertical: kPadding - 10,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 212, 163, 227),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: const Color.fromARGB(255, 30, 29, 29),
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text('จัดการบัญชี Google',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                ),
                SizedBox(height: kPadding - 15),
                AccountWidget(
                  name: 'แพนด้า',
                  mail: 'panda@mailbox.com',
                  imgPath: 'assets/images/1.jpg',
                  key: UniqueKey(),
                ),
                AccountWidget(
                  name: 'เสือน้อย',
                  mail: 'tiger@mailbox.com',
                  imgPath: 'assets/images/2.jpg',
                  key: UniqueKey(),
                ),
                AccountWidget(
                  name: 'สลิด',
                  mail: 'slid@mailbox.com',
                  imgPath: 'assets/images/4.jpg',
                  key: UniqueKey(),
                ),
                SizedBox(height: kPadding - 10),
                Container(
                  margin: EdgeInsets.only(
                    left: kPadding + 5,
                    bottom: kPadding - 10,
                  ),
                  child: Row(children: [
                    Icon(Icons.person_add_alt_1_outlined,
                        size: 20, color: Colors.grey[600]),
                    SizedBox(width: kPadding - 15),
                    Text(' เพิ่มบัญชีอื่น',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700])),
                  ]),
                ),
                Divider(height: 1, color: Colors.grey),
                SizedBox(height: kPadding - 15),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: kPadding - 8,
                    vertical: kPadding - 15,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: kPadding,
                    vertical: kPadding - 10,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 212, 163, 227),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: const Color.fromARGB(255, 30, 29, 29),
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text('ออกจากระบบทุกบัญชี',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDrawerItem(IconData icon, String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = index;
        });
      },
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: kPadding, vertical: kPadding - 10),
        margin: EdgeInsets.only(right: kPadding),
        decoration: BoxDecoration(
          color: index == _selectedItem
              ? const Color.fromARGB(255, 154, 198, 234).withOpacity(0.2)
              : null,
          borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20),
            SizedBox(width: kPadding),
            Text(title, style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}

class AccountWidget extends StatelessWidget {
  const AccountWidget({
    required this.name,
    required this.mail,
    required this.imgPath,
    required Key key,
  }) : super(key: key);
  final String name, mail, imgPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kPadding - 8,
        vertical: kPadding - 15,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: kPadding,
        vertical: kPadding - 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black26,
            offset: Offset(2, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
              radius: 17,
              backgroundImage: AssetImage(imgPath),
              backgroundColor:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)]),
          SizedBox(width: kPadding - 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              Text(mail,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}

class MailItemWidget extends StatelessWidget {
  const MailItemWidget({
    required this.title,
    required this.description,
    required this.content,
    required this.time,
    required this.isRead,
    required Key key,
  }) : super(key: key);
  final String title, description, content, time;
  final bool isRead;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: kPadding - 16),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black26,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Expanded(
        flex: 1,
        child: Row(
          children: [
            CircleAvatar(
                child: Text(title.substring(0, 1)),
                backgroundColor: Colors
                    .primaries[Random().nextInt(Colors.primaries.length)]),
            SizedBox(width: kPadding - 5),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight:
                                isRead ? FontWeight.w600 : FontWeight.w400,
                          ),
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isRead ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                  Text(
                    content,
                    style: TextStyle(fontSize: 13),
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
