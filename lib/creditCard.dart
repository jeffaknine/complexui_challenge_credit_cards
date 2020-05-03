import 'package:flutter/material.dart';

class CreditCardTopRow extends StatelessWidget {
  final bool isDark;

  const CreditCardTopRow({Key key, this.isDark}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color darkText = Color(0xff626F77);
    Color lightText = Color(0xffB6BDC0);
    return Container(
      height: 50,
      padding: EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            isDark ? "black card" : "white card",
            style: TextStyle(
              color: isDark ? lightText : darkText,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
              width: 60,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Color.fromRGBO(255, 255, 255, 0.3),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 1,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Color.fromRGBO(0, 0, 0, 0.1),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

class CreditCard extends StatelessWidget {
  final bool isDark;
  final String number;
  final String expiryMonth;
  final String expiryYear;
  final double balance;
  const CreditCard(
      {Key key,
      this.isDark,
      this.number,
      this.expiryMonth,
      this.expiryYear,
      this.balance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = 350.0;
    var height = width / 1.586;
    Color darkText = Color(0xff626F77);
    Color lightText = Color(0xffB6BDC0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment(-1.2, -1.2),
          end: Alignment(0.7, 0.7),
          colors: isDark
              ? [Color(0xFF93A2AF), Color(0xFF1C333C)]
              : [Color(0xffE3E5E6), Color(0xffAFB7B9)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 20.0,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CreditCardTopRow(
              isDark: isDark,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  number.substring(0, 4),
                  style: TextStyle(
                      color: isDark ? lightText : darkText,
                      fontSize: 20,
                      letterSpacing: 3.0),
                ),
                Text(
                  number.substring(4, 8),
                  style: TextStyle(
                      color: isDark ? lightText : darkText,
                      fontSize: 20,
                      letterSpacing: 3.0),
                ),
                Text(
                  number.substring(8, 12),
                  style: TextStyle(
                      color: isDark ? lightText : darkText,
                      fontSize: 20,
                      letterSpacing: 3.0),
                ),
                Text(
                  number.substring(12, 16),
                  style: TextStyle(
                      color: isDark ? lightText : darkText,
                      fontSize: 20,
                      letterSpacing: 3.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$expiryMonth/$expiryYear",
                  style: TextStyle(
                    color: isDark ? lightText : darkText,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "\$${balance.round().toString()}",
                  style: TextStyle(
                    color: isDark ? lightText : darkText,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
