// tode
// Lewis Lepton
// https://lewislepton.com

package tode;

/*
@uthor lewis lepton 2020
https://lewislepton.com
*/

import kha.graphics2.ImageScaleQuality;
import kha.Image;
import kha.System;
import kha.Scaler;
import kha.ScreenCanvas;

import tode.State;

import tode.World;

import nape.space.Space;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Circle;
import nape.shape.Polygon;

class App {
	var state:State;

	var imageQuality:ImageScaleQuality;

	public function new(){
		Tode.backbuffer = Image.createRenderTarget(Tode.BUFFERWIDTH, Tode.BUFFERHEIGHT);

		imageQuality = Tode.smooth ? ImageScaleQuality.High:ImageScaleQuality.Low;
		
		State.setup();

		// Keyboard.setup();
		// Gamepad.setup();

		kha.input.Keyboard.get().notify(onKeyDown, onKeyUp);
		kha.input.Gamepad.get().notify(onGamepadAxis, onGamepadButton);
		kha.input.Mouse.get().notify(onMouseDown, onMouseUp, onMouseMove, null);
		kha.input.Surface.get().notify(onTouchDown, onTouchUp, onTouchMove);
	}

	public function update():Void {
		World.update(1 / 60);
		if (State.activeState != null){
			State.activeState.update();
		}	
	}

	public function render(canvas:kha.Canvas):Void {
		Tode.backbuffer.g2.begin(true, Tode.color);
		canvas.g2.color = Tode.color;
		canvas.g2.fillRect(0, 0, Tode.backbuffer.width, Tode.backbuffer.height);
		if (State.activeState != null){
			State.activeState.render(Tode.backbuffer);
		}
		Tode.backbuffer.g2.end();

		canvas.g2.begin();
    canvas.g2.imageScaleQuality = imageQuality;
		Scaler.scale(Tode.backbuffer, canvas, System.screenRotation);
		canvas.g2.end();
	}

	public function onKeyDown(keyCode:kha.input.KeyCode):Void {
		if (State.activeState != null){
			State.activeState.onKeyDown(keyCode);
		}
	}

	public function onKeyUp(keyCode:kha.input.KeyCode):Void {
		if (State.activeState != null){
			State.activeState.onKeyUp(keyCode);
		}
	}

	public function onMouseDown(button:Int, x:Int, y:Int){
		Tode.mouseX = Scaler.transformX(x, y, Tode.backbuffer, ScreenCanvas.the, System.screenRotation);
		Tode.mouseY = Scaler.transformY(x, y, Tode.backbuffer, ScreenCanvas.the, System.screenRotation);
		if (State.activeState != null){
			State.activeState.onMouseDown(button, Tode.mouseX, Tode.mouseY);
		}
	}

	public function onMouseUp(button:Int, x:Int, y:Int) {
		Tode.mouseX = Scaler.transformX(x, y, Tode.backbuffer, ScreenCanvas.the, System.screenRotation);
		Tode.mouseY = Scaler.transformY(x, y, Tode.backbuffer, ScreenCanvas.the, System.screenRotation);
		if (State.activeState != null){
			State.activeState.onMouseUp(button, Tode.mouseX, Tode.mouseY);
		}
	}

	public function onMouseMove(x:Int, y:Int, cx:Int, cy:Int) {
		Tode.mouseX = Scaler.transformX(x, y, Tode.backbuffer, ScreenCanvas.the, System.screenRotation);
		Tode.mouseY = Scaler.transformY(x, y, Tode.backbuffer, ScreenCanvas.the, System.screenRotation);
		if (State.activeState != null){
			State.activeState.onMouseMove(Tode.mouseX, Tode.mouseY, cx, cy);
		}
	}

	public function onTouchDown(id:Int, x:Int, y:Int){
		if (State.activeState != null){
			State.activeState.onTouchDown(id, x, y);
		}
	}
	
	public function onTouchUp(id:Int, x:Int, y:Int){
		if (State.activeState != null){
			State.activeState.onTouchUp(id, x, y);
		}
	}

	public function onTouchMove(id:Int, x:Int, y:Int){
		if (State.activeState != null){
			State.activeState.onTouchMove(id, x, y);
		}
	}

	public function onGamepadAxis(axis:Int, value:Float):Void {
		if (State.activeState != null){
			State.activeState.onGamepadAxis(axis, value);
		}
	}

	public function onGamepadButton(button:Int, value:Float):Void {
		if (State.activeState != null){
			State.activeState.onGamepadButton(button, value);
		}
	}
}