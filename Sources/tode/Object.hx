// tode
// Lewis Lepton
// https://lewislepton.com

package tode;

/*
@uthor lewis lepton 2020
https://lewislepton.com
*/

import nape.phys.BodyType;
import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import nape.space.Space;
import nape.phys.Body;
import nape.shape.Circle;
import nape.shape.Polygon;
import nape.geom.Vec2;
import nape.phys.Material;
import nape.callbacks.CbType;

class Object {
	public var x = 0.0;
	public var y = 0.0;
	public var active = true;

	public var body:nape.phys.Body;
	
	public function new(x:Float = 0.0, y:Float = 0.0){
		this.x = x;
		this.y = y;
		body = new nape.phys.Body();
	}

	public function update(){
		if (!active) return;
	}

	public function render(canvas:Canvas){
		if (!active) return;
	}

	public function revive(){
		active = true;
	}

	public function kill(){
		active = false;
	}

	public function material(elastic:Float = 1, dynamicFriction:Float = 0.2, ?staticFriction:Float = 0.4, ?density:Float = 1, rotateFriction:Float = 0.001):Void {
		if (body == null) return;
		body.setShapeMaterials(new Material(elastic, dynamicFriction, staticFriction, density, rotateFriction));
	}

	public function position(x:Float, y:Float):Vec2 {
		return body.position.set(new Vec2(x, y));
	}

	public function impulse(x:Float, y:Float):Body {
		return body.applyImpulse(new Vec2(x, y));
	}

	public function impulseRotate(value:Float):Body {
		return body.applyAngularImpulse(value);
	}

	public function allowMovement(value:Bool = false):Bool {
		return body.allowMovement = value;
	}

	public function allowRotation(value:Bool = false):Bool {
		return body.allowRotation = value;
	}

	public function addType(cbType:CbType):Bool {
		return body.cbTypes.add(cbType);
	}
}