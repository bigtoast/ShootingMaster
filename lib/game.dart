import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flame/components/component.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
//import 'package:flame/flame.dart';

class BBallConfig {
  static double width = 550;
  static double height = 550;
}

class BBall extends SpriteComponent {

  BBall({ui.Image spriteImage}):
    super.fromSprite(
          BBallConfig.width,
          BBallConfig.height,
          Sprite.fromImage(spriteImage, width: BBallConfig.width,
            height: BBallConfig.height,
            x: 550,
            y: 550
          ));

}

class Tester extends Component {
  @override
  void render(Canvas c) {
    var rect = Rect.fromLTWH(0, 0, 100, 100);
    Paint paint = Paint();
    paint.color = Color(0x550011);
    c.drawRect(rect, paint);
  }

  @override
  void update(double t) {
    //log("update tester with ${t}");
  }
}

class ShootingMasterGame extends BaseGame {

  BBall bball;
  ShootingMasterGame(ui.Image image){
    this.bball = new BBall(spriteImage: image);
    log("adding bball");
    //add(bball);
    add(new Tester());
  }



  //@override

}