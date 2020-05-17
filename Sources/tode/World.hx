// tode
// Lewis Lepton
// https://lewislepton.com

package tode;

/*
@uthor lewis lepton 2018
https://lewislepton.com
*/

import nape.space.Space;
import nape.geom.Vec2;

class World {
	public static var space:Space;
	public static var x:Float;
	public static var y:Float;

	public static var velocityIterations:Int = 10;
	public static var positionIterations:Int = 10;

	public static function setup(?x:Float = 0, ?y:Float = 0){
		space = new Space(new Vec2(x, y));
	}

	public static function update(delta:Float){
		if (space != null && delta > 0){
			space.step(delta, velocityIterations, positionIterations);
		}
	}

	public static function linearDrag(value:Float):Float {
		return space.worldLinearDrag = value;
	}

	public static function angularDrag(value:Float):Float {
		return space.worldAngularDrag = value;
	}
}