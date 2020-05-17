// tode
// Lewis Lepton
// https://lewislepton.com

package tode;

/*
@uthor lewis lepton 2020
https://lewislepton.com
*/

import nape.geom.Vec2;
import kha.WindowOptions;
import kha.SystemImpl;
import kha.Framebuffer;
import kha.Scheduler;
import kha.Assets;
import kha.System;
import kha.Color;
import kha.Image;
import kha.Window;
import kha.WindowMode;

import tode.World;

#if kha_html5
import js.html.CanvasElement;
import js.Browser.document;
import js.Browser.window;
#end

class Tode {
  static var app:App;
  public static var WIDTH(default, null):Int = 1280;
	public static var HEIGHT(default, null):Int = 720;
  public static var WIDTHHALF(default, null):Int;
	public static var HEIGHTHALF(default, null):Int;

  public static var backbuffer:Image;
  public static var BUFFERWIDTH(default, null):Int = WIDTH;
  public static var BUFFERHEIGHT(default, null):Int = HEIGHT;

  public static var mouseX = 0;
  public static var mouseY = 0;
  
  public static var gravityX = 0.0;
  public static var gravityY = 0.0;
  public static var velocityIterations = 10;
	public static var positionIterations = 10;

  public static var color:Color;
  public static var smooth:Bool;
  public static var spp:Int = 3;
  public static var title:String = 'Project';

  public static var fullscreen:Bool = true;

  public static var fps = 60.0;

  static var _fps:Float;

  static var _window:Window;
  static var _windowMode:WindowMode;

  public static function setup(config:TodeConfig){
    if (config.width == null) config.width = WIDTH;
    if (config.height == null) config.height = HEIGHT;

    if (config.bufferwidth == null) config.bufferwidth = WIDTH;
    BUFFERWIDTH = config.bufferwidth;
    if (config.bufferheight == null) config.bufferheight = HEIGHT;
    BUFFERHEIGHT = config.bufferheight;

    if (config.fps == null){
      config.fps = 60;
      fps = config.fps;
      // fps = config.fps;
    }

    if (config.color == null) config.color = Color.Black;
    color = config.color;
    
    if (config.smooth == null) config.smooth = false;
    smooth = config.smooth;

    if (config.spp == null) config.spp = 3;
    spp = config.spp;

    if (config.title == null) config.title = 'Project';
    title = config.title;

    if (config.gravityX == null || config.gravityY == null){
      config.gravityX = 0.0;
      config.gravityY = 0.0;
    }

    World.setup(config.gravityX, config.gravityY);

    // _window = Window.get(0);
    // _windowMode = WindowMode.Fullscreen;

    html();

    System.start({
			title:config.title,
      width:config.width,
			height:config.height,
      framebuffer: {
        samplesPerPixel:spp
      }
		},
		function(_){
      // var options:SystemOptions = new SystemOptions();
      // options.window.mode = Fullscreen;
			Assets.loadEverything(function(){
				Scheduler.addTimeTask(update, 0, 1 / fps);
        app = Type.createInstance(config.app, []);
				System.notifyOnFrames(function(framebuffer){
				  render(framebuffer[0]);
				});
			});
		});
  }

  static function init(window:Window){
    _window = window;
    // window.mode = Fullscreen;
  }

  static function update(){
    app.update();
    World.update(1 / 60);
  }

  static function render(framebuffer:Framebuffer){
    app.render(framebuffer);
  }

  static function html():Void {
		#if kha_html5
		document.documentElement.style.padding = '0';
		document.documentElement.style.margin = '0';
		document.body.style.padding = '0';
		document.body.style.margin = '0';
		var canvas = cast(document.getElementById('khanvas'), CanvasElement);
		canvas.style.display = 'block';

		var resize = function() {
			canvas.width = Std.int(window.innerWidth * window.devicePixelRatio);
			canvas.height = Std.int(window.innerHeight * window.devicePixelRatio);
			canvas.style.width = document.documentElement.clientWidth + 'px';
			canvas.style.height = document.documentElement.clientHeight + 'px';
		}
		window.onresize = resize;
		resize();
    #end
	}
}

typedef TodeConfig = {
  app:Class<App>,
  ?title:String,
  ?width:Int,
  ?height:Int,
  ?bufferwidth:Int,
  ?bufferheight:Int,
  ?color:Color,
  ?smooth:Bool,
  ?spp:Int,
  ?fps:Float,
  ?fullscreen:Bool,
  ?gravityX:Float,
  ?gravityY:Float
}