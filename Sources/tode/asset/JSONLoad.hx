// tode
// Lewis Lepton
// https://lewislepton.com

package tode.asset;

using haxe.Json;

class JSONLoad {
  /**
	 * Parse OGMO Editor level .json text
	 * @param json
	 * @return LevelData
	 */
	public static function parse_level_json(json:String):LevelData {
		return cast json.parse();
	}

	/**
	 * Get Entity Layer data matching a given name
	 * @param data
	 * @param name
	 * @return EntityLayer
	 */
	public static function get_object_layer(data:LevelData, name:String):ObjectLayer {
		for (layer in data.layers){
			if (layer.name == name){
				return cast layer;
			}
		}
		return null;
	}
}

// Parsed .JSON Level data
typedef LevelData = {
	width:Int,
	height:Int,
	infinite:Bool,
	offsetX:Int,
	offsetY:Int,
	nextlayerid: Int,
	nextobjectid: Int,
	orientation: String,
	renderorder: String,
	tiledversion: String,
	tilewidth: Int,
	tileheight: Int,
	tilesets: Array<Int>,
	type: String,
	version: Float,
	layers:Array<ObjectLayer>,
}

// Level Layer data
typedef ObjectLayer = {
	color: String,
	draworder: String,
	id: Int,
	name: String,
	objects:Array<ObjectData>,
}

// Level Object data
typedef ObjectData = {
	name: String,
	id: Int,
	x: Int,
	y: Int,
	width: Int,
	height: Int,
	ellipse: Bool,
	rotation: Int,
	type: String,
	visible: Bool,
	properties:Array<PropertyData>,
	text: Array<TextData>,
	polygon: Array<PolygonData>
}

typedef PolygonData = {
	x: Float,
	y: Float
}

typedef PropertyData = {
	name:String,
	type:String,
	value:String
}

typedef TextData = {
	text: String,
	wrap: Bool
}