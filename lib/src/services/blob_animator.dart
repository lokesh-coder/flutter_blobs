import 'package:flutter/material.dart';

class BlobAnimator {
  List<Offset> pathPoints;
  AnimationController animationController;
  List<List<Tween>> tweens = [];
  List<List<Animation>> anims = [];

  BlobAnimator({required this.pathPoints, required this.animationController});

  init(Function(List<Offset>) callback) {
    Animation<double> animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    );
    pathPoints.asMap().forEach((i, p) {
      tweens.insert(i, []);
      anims.insert(i, []);

      tweens[i].add(Tween(begin: 0, end: 0));
      anims[i].add(tweens[i][0].animate(animation));

      tweens[i].add(Tween(begin: 0, end: 0));
      anims[i].add(tweens[i][1].animate(animation));
    });
    animationController.addListener(() {
      List<Offset> transitionPoints = [];
      anims.asMap().forEach((i, value) {
        transitionPoints.add(Offset(
          anims[i][0].value.toDouble(),
          anims[i][1].value.toDouble(),
        ));
      });
      callback(transitionPoints);
    });
    morphTo(pathPoints);
  }

  morphTo(List<Offset> newPathPoints) {
    tweens.asMap().forEach((i, tween) {
      tween[0].begin = tween[0].end;
      tween[0].end = newPathPoints[i].dx + 5;

      tween[1].begin = tween[1].end;
      tween[1].end = newPathPoints[i].dy + 5;
    });
    animationController.reset();
    animationController.forward();
  }
}
