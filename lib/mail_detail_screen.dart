import 'dart:math';
import 'package:flutter/material.dart';
import 'package:Mailbox/data.dart';

class MailDetailScreen extends StatelessWidget {
  MailDetailScreen(
      {required this.heading, required this.mail, required this.time});
  final String heading, mail, time;
  final List<String> menuTabItems = [
    "เลื่อนการแจ้งเตือน",
    "เปลี่ยนป้ายกำกับ",
    "ทำเครื่องหมายว่าไม่สำคัญ",
    "ซ่อน",
    "พิมพ์",
    "รายงานจดหมายขยะ",
    "เพิ่มใน Tasks",
    "ความช่วยเหลือและความคิดเห็น",
  ];
  final List<String> menuMailItems = [
    "ตอบทุกคน",
    "ส่งต่อ",
    "ติดดาว",
    "แปลภาษา",
    "พิมพ์",
    "ทำเครื่องหมายว่ายังไม่อ่านจากที่นี่",
    "บล็อก",
  ];
  final String mailText =
      '1.Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with.\n\n2.The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.\n\n3.The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it\'s seen all around the web; on templates, websites, and stock designs.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 157, 63, 91),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 20,
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.archive_outlined),
            iconSize: 20,
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.delete),
            iconSize: 20,
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.email),
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
      body: Column(
        children: [
          //-------------Title Widget
          Padding(
            padding: EdgeInsets.all(kPadding),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MySize - 10,
                    child: Text(
                      heading,
                      style: TextStyle(
                          color: Colors.black87.withOpacity(0.8), fontSize: 17),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.star_border),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          //-----------Mail Heading Widget
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kPadding),
            child: Row(
              children: [
                CircleAvatar(
                    child: Text(mail.substring(0, 1)),
                    backgroundColor: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)]),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            mail,
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(width: 8),
                          Text(
                            time,
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'ถึงฉัน',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Icon(
                            Icons.expand_more,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(icon: Icon(Icons.keyboard_return), onPressed: () {}),
                InkWell(
                  child: PopupMenuButton(
                    iconSize: 20,
                    icon: Icon(
                      Icons.more_vert_rounded,
                      color: Colors.black54,
                    ),
                    itemBuilder: (context) => menuMailItems
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
          ),
          //-----------------------Mail Info/Content
          Padding(
            padding: EdgeInsets.all(kPadding),
            child: Text(
              mailText,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),
          //-----------------------Last Three Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black54,
                  backgroundColor: Colors.black.withOpacity(0.06),
                ),
                onPressed: () {},
                icon: Icon(Icons.reply),
                label: Text('ตอบ'),
              ),
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black54,
                  backgroundColor: Colors.black.withOpacity(0.06),
                ),
                onPressed: () {},
                icon: Icon(Icons.reply_all),
                label: Text('ตอบทุกคน'),
              ),
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black54,
                  backgroundColor: Colors.black.withOpacity(0.06),
                ),
                onPressed: () {},
                icon: Transform(
                  transform: Matrix4.rotationY(pi),
                  alignment: Alignment.center,
                  child: Icon(Icons.reply),
                ),
                label: Text('ส่งต่อ'),
              )
            ],
          )
        ],
      ),
    );
  }
}
