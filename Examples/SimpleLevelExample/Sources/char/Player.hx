package char;

import kha.Canvas;
import kha.Color;
import kha.input.KeyCode;

import tode.shape.Circle;

class Player extends Circle {
  public var up:Bool;
  public var down:Bool;
  public var left:Bool;
  public var right:Bool;

  public function new(x:Float, y:Float){
    super(x, y, 16);
    allowMovement(true);
    allowRotation(false);
    color = Color.White;
  }

  override public function update(){
    super.update();
    if (left){
      impulse(-2.6, 0);
    } else if (right) {
      impulse(2.6, 0);
    }
  }

  override public function render(canvas:Canvas){
    super.render(canvas);
  }

  public function onKeyDown(keyCode:KeyCode):Void {
    switch (keyCode){
      case Left: left = true;
      case Right: right = true;
    default: return;
    }
  }

  public function onKeyUp(keyCode:KeyCode):Void {
    switch (keyCode){
      case Left: left = false;
      case Right: right = false;
    default: return;
    }
  }
}