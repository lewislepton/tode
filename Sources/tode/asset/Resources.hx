// tode
// Lewis Lepton
// https://lewislepton.com

package tode.asset;

/*
@uthor lewis lepton 2020
https://lewislepton.com
*/

import kha.Assets;
import tode.tmx.TiledMap;

class Resources {

  public static function jsonData(string:String){
    return haxe.Json.parse(haxe.Resource.getString(string));
  }

  public static function tiledMap(string:String){
    // return haxe.xml.Parser.parse(haxe.Resource.getString(string));
    
    // return TiledMap.fromAssets(Assets.blobs.get(string + '_tmx').toString());
    return TiledMap.fromAssets(haxe.Resource.getString(string));
  }
}