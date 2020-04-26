import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flame/components/component.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
//import 'package:flame/flame.dart';

class BBallConfig {
  static double width = 55;
  static double height = 55;
}

class BBall extends SpriteComponent {

  BBall({ui.Image spriteImage}):
    super.fromSprite(
          BBallConfig.width,
          BBallConfig.height,
          Sprite.fromImage(spriteImage, width: BBallConfig.width,
            height: BBallConfig.height,
            x: 55,
            y: 55
          ));

}

class ShootingMasterGame extends BaseGame {

  BBall bball;
  ShootingMasterGame(ui.Image image){
    this.bball = new BBall(spriteImage: image);
    log("adding bball");
    this.add(bball);
  }
}