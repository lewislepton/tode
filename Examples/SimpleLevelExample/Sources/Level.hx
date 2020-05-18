package;

import kha.Assets;
import kha.math.Vector2;
import kha.Canvas;

import tode.tmx.TiledMap;
import tode.tmx.TiledObjectGroup;

import world.Platform;
import world.PolyPlatform;

import char.Player;
import char.Enemy;

// a workable but also lightly glitchy level loader & handler for our objects & tile rendering. lives here to take away this type of code from the level/state files
// needs working on

class Level {
	public static var map:TiledMap;

	// basic player spawn point - much safer than the other way below, which is not active 😘
	public static var spawnLayer:TiledObjectGroup;
	
	public static var players:Array<Player>;
	public static var playersLayer:TiledObjectGroup;

	// for generating platforms from the tiled file
	public static var platforms:Array<Platform>;
	public static var platformsLayer:TiledObjectGroup;

	public static var polyplatforms:Array<PolyPlatform>;
	public static var polyplatformsLayer:TiledObjectGroup;

	public static var enemies:Array<Enemy>;
	public static var enemiesLayer:TiledObjectGroup;

	public static function setup(){
		// simple XML/TMX loader. this can be shorthanded as well & even made possible to hide the files away inside the executable, but there is more to that option 😘
		map = TiledMap.fromAssets(Assets.blobs.tiledmap_tmx.toString());
		init();
	}

	public static function init(){
		setupSpawn();
		setupPlatform();
		setupEnemy();
	}

	public static function update(){
		// updating is good - because it just means if anything gets moved, things are updated
		for (platform in platforms){
			platform.update();
		}

		for (enemy in enemies){
			enemy.update();
		}
	}

	public static function render(canvas:Canvas){
		// renders the tiles made in Tiled
		map.render(canvas);

		// this is purely for show, just so you can see your collision
		for (platform in platforms){
			platform.render(canvas);
		}

		for (enemy in enemies){
			enemy.render(canvas);
		}
	}

	public static function clear(){
		platforms = [];
		enemies = [];
	}

	// spawn point - something easy. could be better. but its something to fix the weird multiple hidden objects spawning. so now its a spawn point instead
	private static function setupSpawn(){
		// spawn = [];
		spawnLayer = map.getObjectGroupByName('spawn');
	}

	// NEEDS FIXING - SEEMS TO SPAWN MULTIPLES & NEED TO SORT OUT, PLUS BORKS WITH SOME SETTINGS - BUT LUCKILY EVERYTHING ELSE SEEMS FIN [RUNS]... FOR NOW 😘
	// Player - a very simple setup
	private static function setupPlayer(){
		players = [];
		playersLayer = map.getObjectGroupByName('player');
		for (object in playersLayer.objects){
			players.push(new Player(object.x, object.y));
		}
	}
	
	// Platform - kind of like the player but WAY easier
	private static function setupPlatform(){
		platforms = [];
		platformsLayer = map.getObjectGroupByName('platform');
		for (object in platformsLayer.objects){
			platforms.push(new Platform(object.x, object.y, object.width, object.height));
		}
	}

	// Polygon shapes are currently not working. But this is the type of thing that helps in creating them 😉
	private static function setupPolyPlatform(){
		polyplatforms = [];
		polyplatformsLayer = map.getObjectGroupByName('polygon');
		for (object in polyplatformsLayer.objects){
			var vec = object.polygon.points.map(function(coord) return new Vector2(coord.x, coord.y));
			polyplatforms.push(new PolyPlatform(object.x, object.y, vec));
		}
	}

	// Enemy - much like platform, very easy to setup
	private static function setupEnemy(){
		enemies = [];
		enemiesLayer = map.getObjectGroupByName('enemy');
		for (object in enemiesLayer.objects){
			enemies.push(new Enemy(object.x, object.y, object.width, object.height));
		}
	}
}