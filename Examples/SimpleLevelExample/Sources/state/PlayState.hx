package state;

import kha.Canvas;
import kha.input.KeyCode;

import tode.State;

import char.Player;

import Level;

class PlayState extends State {
	var level:Level;
	var _player:Player;

	public function new(){
		super();

		// i dont want this here - i want it in the Scene or State - it doesnt need to be around in the open flashing its netherealms ;)
		level = new Level();
		
		for (spawn in level.spawnLayer){
			_player = new Player(spawn.x, spawn.y);
			add(_player);
		}
	}
	
	override public function update(){
		// i dont want this here - i want it in the Scene or State - it doesnt need to be around in the open flashing its netherealms
		level.update();
		
		super.update();
	}
	
	override public function render(canvas:Canvas){
		// i dont want this here - i want it in the Scene or State - it doesnt need to be around in the open flashing its netherealms
		level.render(canvas);

		super.render(canvas);
	}

	override public function onKeyDown(keyCode:KeyCode):Void {
		_player.onKeyDown(keyCode);
		switch (keyCode){
			case F: State.set(new MenuState());
		default: return;
		}
	}

	override public function onKeyUp(keyCode:KeyCode):Void {
		_player.onKeyUp(keyCode);
	}

	override public function onMouseMove(x:Int, y:Int, mx:Int, my:Int):Void {
		_player.body.position.x = x;
		_player.body.position.y = y;
	}
}