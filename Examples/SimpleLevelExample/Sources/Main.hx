package;

import tode.Tode;

// setup for a tode project is easy. you ALWAYS NEED the 'app' in the setup. you can change the Project name & file name for it, just make sure you put it in the setup 👍
class Main {
	public static function main(){
		Tode.setup({app:Project, title:'Simple Level Example', bufferwidth:512, bufferheight:256, gravityX:0, gravityY:60});
	}
}

// diffenet settings we can have
// title:String
// width:Int
// height:Int
// bufferwidth:Int
// bufferheight:Int
// color:Color
// smooth:Bool
// spp:Int
// fps:Float
// fullscreen:Bool
// gravityX:Float
// gravityY:Float