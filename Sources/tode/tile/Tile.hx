// tode
// Lewis Lepton
// https://lewislepton.com

package tode.tile;

import tode.shape.Rectangle;

class Tile extends Rectangle {
	public var index:Int;

	public function new(x:Float, y:Float, width:Float, height:Float, index:Int):Void {
		super(x, y, width, height);
		this.index = index;
	}
}