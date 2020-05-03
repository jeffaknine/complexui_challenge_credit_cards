import 'package:chal2/itemFader.dart';
import 'package:chal2/page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  GlobalKey<AppState> globalKey = GlobalKey<AppState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: App(key: globalKey));
  }
}

class App extends StatefulWidget {
  const App({
    Key key,
  }) : super(key: key);
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> with TickerProviderStateMixin {
  bool isDark = true;
  AnimationController colorAnimationController;
  Animation colorAnimation;
  // AnimationController animationController;
  AnimationStatus animationStatus;
  Animation slideAnimation;
  Color backgroundColor = Color(0xff354D57);
  List<GlobalKey<ItemFaderState>> keys;

  int isDone = 0;
  done() {
    print(isDone);
    setState(() {
      isDone += 1;
    });
    print(isDone);
  }

  @override
  void initState() {
    colorAnimationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    colorAnimation =
        ColorTween(begin: Color(0xff354D57), end: Color(0xffDCDFE0))
            .animate(colorAnimationController);
    colorAnimation.addStatusListener((listener) {
      setState(() {
        backgroundColor = colorAnimation.value;
      });
    });
    keys = List.generate(14, (_) => GlobalKey<ItemFaderState>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
      animation: colorAnimation,
      builder: (context, child) {
        return Container(
          color: colorAnimation.value,
          child: child,
        );
      },
      child: Stack(
        children: isDone.isOdd
            ? [
                Positioned(
                  top: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 150,
                    width: MediaQuery.of(context).size.width,
                    child: Page(
                      isOdd: isDone.isOdd,
                      appKey: widget.key,
                      keys: keys,
                      slidAnimation: slideAnimation,
                      colorAnimationController: colorAnimationController,
                      isDark: false,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height - 150,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 150,
                    width: MediaQuery.of(context).size.width,
                    child: Page(
                      isOdd: isDone.isOdd,
                      appKey: widget.key,
                      keys: keys,
                      slidAnimation: slideAnimation,
                      colorAnimationController: colorAnimationController,
                      isDark: true,
                    ),
                  ),
                )
              ]
            : [
                Positioned(
                  top: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 150,
                    width: MediaQuery.of(context).size.width,
                    child: Page(
                      isOdd: isDone.isOdd,
                      appKey: widget.key,
                      keys: keys,
                      slidAnimation: slideAnimation,
                      colorAnimationController: colorAnimationController,
                      isDark: true,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height - 150,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 150,
                    width: MediaQuery.of(context).size.width,
                    child: Page(
                      isOdd: isDone.isOdd,
                      appKey: widget.key,
                      keys: keys,
                      slidAnimation: slideAnimation,
                      colorAnimationController: colorAnimationController,
                      isDark: false,
                    ),
                  ),
                )
              ],
      ),
    ));
  }
}
