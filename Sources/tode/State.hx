// tode
// Lewis Lepton
// https://lewislepton.com

package tode;

/*
@uthor lewis lepton 2020
https://lewislepton.com
*/

import kha.Canvas;
import kha.input.KeyCode;

import tode.Scene;

import nape.space.Space;
import nape.geom.Vec2;

import Level;

class State extends Scene {
	
	public static var activeState:State;
	static var states:Map<String, State>;

	public static var width:Int;
	public static var height:Int;
	
	public function new(){
		super();
		Level.setup();
	}

	override public function update(){
		super.update();
		Level.update();
	}

	override public function render(canvas:Canvas){
		super.render(canvas);
		Level.render(canvas);
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

	public static function setup(){
		states = new Map<String, State>();
	}

	public static function addState(name:String, state:State):State {
		states.set(name, state);
		return state;
	}

	// override public function addEntity(object:Group){
	// 	super.addEntity(object);
	// }

	// override public function removeComponent(object:Group){
	// 	super.removeComponent(object);
	// }

	public static function removeState(name:String){
		states.remove(name);
	}

	public static function set(name:String){
		activeState = states.get(name);
	}
}