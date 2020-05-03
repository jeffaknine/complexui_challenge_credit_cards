import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  final double amount;
  final bool isDark;
  const Transaction(
      {Key key, this.title, this.subtitle, this.icon, this.amount, this.isDark})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color textLight = Color(0xffCACFD2);
    Color textDark = Color(0xff374C54);
    return ListTile(
      // contentPadding: EdgeInsets.all(0),
      dense: true,
      leading: CircleAvatar(
        backgroundColor: textLight,
        child: Text(
          icon,
          style: TextStyle(
            color: textDark,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            color: isDark ? textLight : textDark, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: isDark ? textLight : textDark,
        ),
      ),
      trailing: Text(
        "-\$${amount.toString()}",
        style: TextStyle(
            color: isDark ? textLight : textDark,
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }
}
