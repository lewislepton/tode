package world;

import kha.Canvas;
import kha.math.Vector2;

import tode.shape.Polygon;

class PolyPlatform extends Polygon {
  public function new(x:Float, y:Float, vertcies:Array<Vector2>){
    super(x, y, vertcies);
    allowMovement(false);
    allowRotation(false);
  }

  override public function update(){
    super.update();
  }

  override public function render(canvas:Canvas){
    super.render(canvas);
  }
}