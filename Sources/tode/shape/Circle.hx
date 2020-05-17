// tode
// Lewis Lepton
// https://lewislepton.com

package tode.shape;

/*
@uthor lewis lepton 2020
https://lewislepton.com
*/

import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import nape.space.Space;
import nape.geom.Vec2;
import nape.phys.Material;
import nape.callbacks.CbType;

import tode.Object;
import tode.World;

class Circle extends Object {
	public var radius = 32.0;
	
  public var shape:nape.shape.Circle;

  public function new(x:Float = 0.0, y:Float = 0.0, radius:Float = 32, ?sensorEnabled:Bool = false){
		super();
    this.radius = radius;

		shape = new nape.shape.Circle(radius);
		shape.body = body;
		body.shapes.add(shape);
		body.space = World.space;
		body.position.x = x;
		body.position.y = y;
	}
	
	override public function update(){
	}

  override public function render(canvas:Canvas){
		super.render(canvas);
    var pos:Vec2;
    pos = body.position;

		// canvas.g2.pushTranslation(pos.x, pos.y);
		// canvas.g2.rotate(body.rotation, pos.x, pos.y);
    canvas.g2.fillCircle(body.position.x, body.position.y, radius);
		// canvas.g2.popTransformation();
  }

	public function sensorEnabled(value:Bool = false):Bool {
		return shape.sensorEnabled = value;
	}

	public function sensorGroup(value:Int = 1):Int {
		return shape.filter.sensorGroup = value;
	}

	public function sensorMask(value:Int = -1):Int {
		return shape.filter.sensorMask = value;
	}

	public function fluidEnabled(value:Bool = false):Bool {
		return shape.fluidEnabled = value;
	}

	public function fluidMask(value:Int = -1):Int {
		return shape.filter.fluidMask = value;
	}
	
	public function fluidGroup(value:Int = 1):Int {
		return shape.filter.fluidGroup = value;
	}

	public function density(value:Float = 1):Float {
		return shape.fluidProperties.density = value;
	}

	public function viscosity(value:Float = 1):Float {
		return shape.fluidProperties.viscosity = value;
	}

	public function collisionGroup(value:Int = 1):Int {
		return shape.filter.collisionGroup = value;
	}

	public function collisionMask(value:Int = -1):Int {
		return shape.filter.collisionGroup = value;
	}
}