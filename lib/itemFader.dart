import 'package:flutter/material.dart';

class ItemFader extends StatefulWidget {
  final Widget child;
  final bool leaving;
  final Animation slidAnimation;
  const ItemFader({
    Key key,
    this.child,
    this.leaving,
    this.slidAnimation,
  }) : super(key: key);
  @override
  ItemFaderState createState() => ItemFaderState();
}

class ItemFaderState extends State<ItemFader> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation slideAnimation;

  TickerFuture animate() {
    return animationController.forward();
  }

  reset() {
    animationController.reset();
  }

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    animationController.addStatusListener((status) {});
    slideAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slideAnimation,
      child: widget.child,
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(
              0,
              -slideAnimation.value *
                  (MediaQuery.of(context).size.height - 150)),
          child: child,
        );
      },
    );
  }
}
