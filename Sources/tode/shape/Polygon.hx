// tode
// Lewis Lepton
// https://lewislepton.com

package tode.shape;

/*
@uthor lewis lepton 2020
https://lewislepton.com
*/

import kha.Color;
import kha.math.FastMatrix3;
import kha.math.Vector2;
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

class Polygon extends Object {
  public var width:Float;
	public var height:Float;
	public var color:Color = Color.fromFloats(0.6, 0.6, 0.6);

	public var shape:Pol;

  public var fill:Bool;
  
  var vert:Array<Vector2> = new Array<Vector2>();

	public function new(?x:Float = 0.0, ?y:Float = 0.0, ?vertices:Array<Vector2>, ?sensorEnabled:Bool = false){
		super(x, y);
    this.vert = vertices;

		shape = new Pol(Pol.regular(width, height, vert.length));
		shape.body = body;
		body.shapes.add(shape);
		body.space = World.space;
		body.position.x = x;
    body.position.y = y;
	}

	override public function render(canvas:Canvas){
		super.render(canvas);
		var pos:Vec2;
		pos = body.position;    
    canvas.g2.color = color;
    canvas.g2.pushTransformation(FastMatrix3.translation(body.position.x, body.position.y));
    canvas.g2.rotate(body.rotation, body.position.x, body.position.y);
    canvas.g2.fillPolygon(0, 0, vert);
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