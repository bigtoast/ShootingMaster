import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flame/flame.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';

import 'game.dart';

void main() {
  runApp(MaterialApp(
    title: 'Shooting Master',
    color: Colors.purple,
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: ShootingMasterGameWrapper(),
    )
  ));
  Flame.util.fullScreen();
}

class ShootingMasterGameWrapper extends StatefulWidget {
  @override
  _ShootingMasterGameWrapperState createState() => _ShootingMasterGameWrapperState();
}

class _ShootingMasterGameWrapperState extends State<ShootingMasterGameWrapper> {
  bool splashGone = false;
  ShootingMasterGame game;

  @override
  void initState(){
    super.initState();
    startGame();
  }

  void startGame() {
    Flame.images.loadAll(["bball.png"]).then( (image) => {
        setState(() {
          log("images loaded. starting game");
          game = new ShootingMasterGame(image[0]);
        })
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildGame(context);
    /*return splashGone
        ? _buildGame(context)
        : FlameSplashScreen(
      theme: FlameSplashTheme.white,
      onFinish: (context) {
        setState(() {
          log("setting splash gone.");
          splashGone = true;
        });
      },
    );*/
  }

  Widget _buildGame(BuildContext context) {
    if ( game == null ) {
      log("game null.. loading");
      return const Center(
        child: Text("Loading..."),
      );
    }
    log("returning container and game widget");
    return Container(
      color: Colors.blue,
      constraints: const BoxConstraints.expand(),
      child: Container(
        child: game.widget,
      )
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 99;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hi Jason, you are the best!!! :',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
