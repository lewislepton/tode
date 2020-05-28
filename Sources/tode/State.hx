// tode
// Lewis Lepton
// https://lewislepton.com

package tode;

/*
@uthor lewis lepton 2020
https://lewislepton.com
*/

// import tode.Listen;
import kha.Canvas;
import kha.input.KeyCode;

import tode.Tode;
import tode.Scene;

class State extends Scene {
	public static var width:Int;
	public static var height:Int;

	public var created:Bool = false;
	
	public function new(){
		super();
		created = true;
	}

	override public function update(){
		super.update();
	}

	override public function render(canvas:Canvas){
		super.render(canvas);
	}

	public function onKeyDown(keyCode:KeyCode){}

	public function onKeyUp(keyCode:KeyCode){}

	public function onMouseDown(button:Int, x:Int, y:Int){}

	public function onMouseUp(button:Int, x:Int, y:Int){}

	public function onMouseMove(x:Int, y:Int, cx:Int, cy:Int){}

	public function onTouchDown(id:Int, x:Int, y:Int){}
	
	public function onTouchUp(id:Int, x:Int, y:Int){}

	public function onTouchMove(id:Int, x:Int, y:Int){}

	public function onGamepadAxis(axis:Int, value:Float){}

	public function onGamepadButton(button:Int, value:Float){}

	public static function set(state:State){
		Tode.state = state;
		if (!Tode.state.created) Tode.setup();
	}
}