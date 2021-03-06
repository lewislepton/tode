package world;

import kha.Color;
import kha.Canvas;

import tode.shape.Rectangle;

class Platform extends Rectangle {
  public function new(x:Float, y:Float, width:Float, height:Float){
    super(x, y, width, height);
    allowMovement(false);
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