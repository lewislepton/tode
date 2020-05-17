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
import nape.space.Space;
import nape.phys.Body;
import nape.shape.Circle;
import nape.shape.Polygon in Pol;
import nape.geom.Vec2;
import nape.phys.Material;
import nape.callbacks.CbType;

import tode.World;

import tode.Object;

class Rectangle extends Object {
  public var width:Float;
	public var height:Float;

	public var shape:Pol;

	public var fill:Bool;

	public function new(?x:Float = 0.0, ?y:Float = 0.0, ?width:Float = 0, ?height:Float = 0, ?sensorEnabled:Bool = false){
		super();
		this.width = width;
		this.height = height;

		shape = new Pol(Pol.box(width, height));
		shape.body = body;
		body.shapes.add(shape);
		body.space = World.space;
		body.position.x = x + width / 2;
		body.position.y = y + height / 2;
	}

	override public function render(canvas:Canvas){
		super.render(canvas);
		var pos:Vec2;
		pos = body.position;
		canvas.g2.pushTranslation(pos.x, pos.y);
		canvas.g2.rotate(body.rotation, 0, 0);
		canvas.g2.fillRect(0 - width / 2, 0 - height / 2, width, height);
		canvas.g2.popTransformation();
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