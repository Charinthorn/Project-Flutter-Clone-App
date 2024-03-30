class MailItem {
  String title, description, content, time;
  bool isRead;
  MailItem({
    required this.title,
    required this.description,
    required this.content,
    required this.time,
    required this.isRead,
  });
}

double MySize = 0.0;
double kPadding = MySize * 0.025;

List<MailItem> mailList = [
  MailItem(
    title: 'Google',
    description: 'การแจ้งเตือนความปลอดภัยสำหรับ s640305162..',
    content: 'อีเมลนี้เป็นสำเนาการแจ้งเตือน!',
    time: '4:00 am',
    isRead: false,
  ),
  MailItem(
    title: 'KMUTNB',
    description: 'แจ้งนักศึกษาทุกคนให้ประเมินอาจาร์ยก่อนหมดเวลาประเมิน',
    content: 'ประกาศจากงานวิชาการ',
    time: '3:30 pm',
    isRead: true,
  ),
  MailItem(
    title: 'Quora',
    description: 'Read more content',
    content: 'Dummy content for the mail app!',
    time: '12:20 pm',
    isRead: false,
  ),
  MailItem(
    title: 'Google',
    description: 'Your account may have been tampered!',
    content: 'Dummy content for the mail app!',
    time: '5:40 pm',
    isRead: true,
  ),
  MailItem(
    title: 'Instagram',
    description: 'Waste of time if you use alot',
    content: 'Dummy content for the mail app!',
    time: '5:30 pm',
    isRead: false,
  ),
  MailItem(
    title: 'OpenAI',
    description: 'Updates to our Terms of Use & Privac..',
    content: 'We want to let you know about...',
    time: '2:00 am',
    isRead: false,
  ),
  MailItem(
    title: 'Discord',
    description: 'ยืนยันที่อยู่อีเมลกับ Discord',
    content: 'Hey biw.,Thanks for registeri..',
    time: '1:05 pm',
    isRead: true,
  ),
  MailItem(
    title: 'FreeIcon',
    description: 'Get the best free icons',
    content: 'Dummy content for the mail app!',
    time: '7:00am',
    isRead: true,
  ),
  MailItem(
    title: 'ICIT Account,KMUTNB',
    description: 'การแจ้งเตือนความปลอดภัย ICIT Account สำหรับ s6403051623151',
    content: 'อีเมลฉบับนี้ส่งถึง b.biw15138@gmail.com ',
    time: '3:00 am',
    isRead: false,
  ),
  MailItem(
    title: 'Shopee',
    description: '[โปรฟิน...]รับโค้ดลดถึง 350.-',
    content: 'shopee mall|shopee pri...',
    time: '17:58 pm',
    isRead: true,
  ),
  MailItem(
    title: 'Jio',
    description: 'Your plan is about to expire',
    content: 'Dummy content for the mail app!',
    time: '10:00 pm',
    isRead: false,
  ),
  MailItem(
    title: 'Samsung account',
    description: 'โปรดรีเซ็ทรหัสผ่านของคุณ',
    content: 'คุณได้รีเซ็ทรหัสผ่านของคุณ และมี...',
    time: '18:45 am',
    isRead: true,
  ),
];
