import 'package:chal2/creditCard.dart';
import 'package:chal2/itemFader.dart';
import 'package:chal2/transaction.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Page extends StatefulWidget {
  final bool isDark;
  final Animation slidAnimation;
  final AnimationController colorAnimationController;
  final List<GlobalKey<ItemFaderState>> keys;
  final GlobalKey<AppState> appKey;
  final bool isOdd;
  const Page({
    Key key,
    this.isDark,
    this.colorAnimationController,
    this.slidAnimation,
    this.keys,
    this.appKey,
    this.isOdd,
  }) : super(key: key);
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () async {
            widget.colorAnimationController.value == 1
                ? widget.colorAnimationController.reverse()
                : widget.colorAnimationController.forward();
            var start = !widget.isOdd ? 0 : 7;
            var end = !widget.isOdd ? 7 : 14;
            var start2 = !widget.isOdd ? 7 : 0;
            var end2 = !widget.isOdd ? 14 : 7;
            await Future.forEach(
                widget.keys.sublist(start, end)
                  ..addAll(widget.keys.sublist(start2, end2)),
                (GlobalKey<ItemFaderState> key) async {
              await Future.delayed(
                  Duration(milliseconds: 40)); //.then((onValue) {
              key.currentState.animate().then((f) async {
                await Future.delayed(Duration(milliseconds: 200));
              });
            });
            await Future.delayed(Duration(milliseconds: 600));
            widget.appKey.currentState.done();
            await Future.forEach(widget.keys,
                (GlobalKey<ItemFaderState> key) async {
              key.currentState.reset();
            });
            // print('ALL DONE');
          },
          child: ItemFader(
            key: widget.isDark ? widget.keys[0] : widget.keys[7],
            slidAnimation: widget.slidAnimation,
            leaving: true,
            child: SafeArea(
              child: Padding(
                  padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: CreditCard(
                    balance: 4735,
                    expiryMonth: '07',
                    expiryYear: '24',
                    number: '5335123456789012',
                    isDark: widget.isDark,
                  )),
            ),
          ),
        ),
        ItemFader(
          key: widget.isDark ? widget.keys[1] : widget.keys[8],
          slidAnimation: widget.slidAnimation,
          leaving: true,
          child: Padding(
            padding: EdgeInsets.only(top: 0, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(180),
                  ),
                  child: Icon(
                    Icons.assessment,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "TRANSACTION HISTORY",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(180),
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        ItemFader(
          key: widget.isDark ? widget.keys[2] : widget.keys[9],
          slidAnimation: widget.slidAnimation,
          leaving: true,
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Text(
              "Today",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Column(
          // shrinkWrap: true,
          children: <Widget>[
            ItemFader(
              key: widget.isDark ? widget.keys[3] : widget.keys[10],
              slidAnimation: widget.slidAnimation,
              leaving: true,
              child: Transaction(
                isDark: widget.isDark,
                title: "NETFLIX",
                amount: 12.0,
                subtitle: "Cinema",
                icon: "N",
              ),
            ),
            ItemFader(
              key: widget.isDark ? widget.keys[4] : widget.keys[11],
              slidAnimation: widget.slidAnimation,
              leaving: true,
              child: Transaction(
                isDark: widget.isDark,
                title: "MCDONALDS",
                amount: 6.0,
                subtitle: "Restaurants",
                icon: "M",
              ),
            ),
            ItemFader(
              key: widget.isDark ? widget.keys[5] : widget.keys[12],
              slidAnimation: widget.slidAnimation,
              leaving: true,
              child: Transaction(
                isDark: widget.isDark,
                title: "OKKO",
                amount: 43.0,
                subtitle: "Petrol",
                icon: "O",
              ),
            ),
            ItemFader(
              key: widget.isDark ? widget.keys[6] : widget.keys[13],
              slidAnimation: widget.slidAnimation,
              leaving: true,
              child: Transaction(
                isDark: widget.isDark,
                title: "GLOVO",
                amount: 9.0,
                subtitle: "Delivery",
                icon: "G",
              ),
            ),
            // Transaction(
            //   isDark: widget.isDark,
            //   title: "APPLE",
            //   amount: 1299.0,
            //   subtitle: "GADGET & TECHNOLOGY",
            //   icon: "A",
            // ),
            // Transaction(
            //   isDark: widget.isDark,
            //   title: "NIKE",
            //   amount: 38.0,
            //   subtitle: "SPORTWEAR",
            //   icon: "N",
            // ),
          ],
        ),
      ],
    );
  }
}
