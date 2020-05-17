// tode
// Lewis Lepton
// https://lewislepton.com

package tode.tool;

/*
	@uthor lewis lepton 2018
	lewislepton.com
 */
import kha.math.Vector2;

class Util {
	public static inline var PI = 3.141592653589793;
	public static inline var EPSILON = 0.0000001;

	/**
		converts degrees to radians
	**/
	public static inline function degToRad(value:Float):Float {
		return value * Math.PI / 180;
	}

	/**
		converts radians to degrees
	**/
	public static inline function radToDeg(value:Float):Float {
		return value * 180 / Math.PI;
	}

	/**
		calculates the distance between 2 points
	**/
	public static inline function distance(a:Vector2, b:Vector2) {
		return Math.sqrt(Math.pow(a.x - b.x, 2) + Math.pow(a.y - b.y, 2));
	}

	/**
		random floating number that only goes between 0 & set int value
	**/
	public static inline function randomFloat(value:Float):Float {
		return Math.random() * value;
	}

	/**
		random ranged floating number that only goes between the min & max values set
	**/
	public static inline function randomRangeFloat(min:Float, max:Float):Float {
		// return Math.random() * (1 + max - min) + min;
		return Math.random() * (max - min) + min;
	}

	/**
		random interger number that only goes between 0 & set int value
	**/
	public static inline function randomInt(value:Int):Int {
		return Math.floor(Math.random() * value);
	}

	/**
		random ranged interger number that only goes between the min & max values set
	**/
	public static inline function randomRangeInt(min:Int, max:Int):Int {
		return Math.floor(Math.random() * (1 + max - min)) + min;
	}

	/**
		randomise bool
	**/
	public static inline function randomBool():Bool {
		return Math.random() > 0.5;
	}

	public static function vectorDegrees(x:Float, y:Float, originX:Float = 0.0, originY:Float = 0.0):Float {
		var a = Math.atan2(y - originY, x - originX) * 180 / Math.PI;
		return a < 0 ? a + 360 : a;
	}

	// public static function degreesFrom(x1:Float, y1:Float, x2:Float, y2:Float):Float {
	//   var a = Math.atan2(y2 - y1, x2 - x1) * 180 / Math.PI;
	//   return a < 0 ? a + 360 : a;
	// }

	/**
		scales one floating point min & max value to another min & max value

		example:
		input min[0] max[128] | output min[0.9] max[23.6]
	**/
	public static inline function scale(value:Float, minIn:Float, maxIn:Float, minOut:Float, maxOut:Float):Float {
		return minOut + (maxOut - minOut) * ((value - minIn) / (maxIn - minIn));
	}

	public static inline function lerp(value:Float, min:Float, max:Float):Float {
		// return min + (max - min) * value;
		return min + value * (max - min);
	}

	public static inline function constrain(value:Float, min:Float, max:Float):Float {
		return (value < min) ? min : ((value > max) ? max : value);
	}

	public static inline function min(a:Float, b:Float):Float {
		return (a < b) ? a : b;
	}

	public static inline function max(a:Float, b:Float):Float {
		return (a > b) ? a : b;
	}

	public static inline function pythagoras(x:Float, y:Float):Float {
		return Math.sqrt(x * x + y * y);
	}

	public static function cosineRule(a:Float, b:Float, c:Float):Float {
		var angle:Float = (b * b + c * c - a * a) / (2 * b * c);
		return Math.cos(angle);
	}

	public static function implementBound(value:Float, min:Float, max:Float):Float {
		return Math.min(Math.max(min, value), max);
	}

	public static function bound(value:Float, ?min:Float, ?max:Float):Float {
		var lower:Float = (min != null && value < min) ? min : value;
		return (max != null && lower > max) ? max : lower;
	}

	public static function pointInCoordinates(pointX:Float, pointY:Float, rectX:Float, rectY:Float, rectWidth:Float, rectHeight:Float):Bool {
		if (pointX >= rectX && pointX <= (rectX + rectWidth)) {
			if (pointY >= rectY && pointY <= (rectY + rectHeight)) {
				return true;
			}
		}
		return false;
	}

	public static inline function fade(value:Float):Float {
		return value * value * value * (value * (value * 6 - 15) + 10);
	}

	public static inline function gradual(hash:Int, x:Float, y:Float, z:Float):Float {
		var h:Int = hash & 15;
		var u:Float = h < 8 ? x : y;

		var v:Float;

		if (h < 4)
			v = y;
		else if (h == 12 || h == 14)
			v = x;
		else
			v = z;

		return ((h & 1) == 0 ? u : -u) + ((h & 2) == 0 ? v : -v);
	}

	public static function clamp(value:Float, min:Float, max:Float):Float {
		if (max > min) {
			if (value < min)
				return min;
			else if (value > max)
				return max;
			else
				return value;
		} else {
			// Min/max swapped
			if (value < max)
				return max;
			else if (value > min)
				return min;
			else
				return value;
		}
	}
}
