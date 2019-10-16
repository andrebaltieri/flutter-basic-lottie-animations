import 'package:flutter/material.dart';
import 'package:fluttie/fluttie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FluttieAnimationController animationCtrl;

  @override
  initState() {
    super.initState();
    prepareAnimation();
  }

  @override
  dispose() {
    super.dispose();
    animationCtrl?.dispose();
  }

  prepareAnimation() async {
    var instance = Fluttie();

    var checkAnimation =
        await instance.loadAnimationFromAsset("assets/check.json");

    animationCtrl = await instance.prepareAnimation(
      checkAnimation,
      duration: const Duration(seconds: 2),
      repeatCount: const RepeatCount.dontRepeat(),
      repeatMode: RepeatMode.START_OVER,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            alignment: Alignment.center,
          ),
          FluttieAnimation(animationCtrl),
          FlatButton(
            color: Color(0xFFC767E7),
            child: Text(
              "CADASTRAR",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                animationCtrl.start();
              });
            },
          )
        ],
      ),
    );
  }
}
