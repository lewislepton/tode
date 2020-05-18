package char;

import kha.Canvas;
import kha.Color;

import tode.shape.Rectangle;

class Enemy extends Rectangle {
  public function new(x:Float, y:Float, width:Float, height:Float){
    super(x, y, width, height);
    allowMovement(true);
    allowRotation(false);
    color = Color.White;
  }

  override public function update(){
    super.update();
  }

  override public function render(canvas:Canvas){
    super.render(canvas);
  }
}