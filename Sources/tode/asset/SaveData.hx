// tode
// Lewis Lepton
// https://lewislepton.com

package tode.asset;

import haxe.Json;
import kha.Storage;
import kha.StorageFile;

class SaveData {
	private var data:Dynamic;
	private var saved:Bool = false;

	public function new(){}

	public function create(){
		data = getSave().readObject();
	}

	public function set(id:String, val:Dynamic){
		Reflect.setField(data, id, val);
	}

	public function get(id:String):Dynamic {
		return Reflect.field(data, id);
	}

	public function save(){
		getSave().writeObject(data);
		saved = true;
	}

	public function erase(){
		data = {};
		getSave().writeObject(data);
	}

	public function isSaved():Bool {
		return saved;
	}

	public function getSave():StorageFile {
		return Storage.namedFile("gamesave.kha");
	}
}