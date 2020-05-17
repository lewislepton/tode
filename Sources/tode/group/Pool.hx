// tode
// Lewis Lepton
// https://lewislepton.com

package tode.group;

/*
@uthor lewis lepton 2020
https://lewislepton.com
*/

import tode.Object;
import kha.Canvas;

// typedef PoolGroup = Pool<Object>;

class Pool<O:Object> {
	public var entity:Array<O>;
	public var max:Int;

	public var countEntities(get, null):Int;

	private function get_countEntities():Int {
		return entity.length;
	}

	public function new(max:Int = 100){
		this.max = max;
		entity = new Array<O>();
	}

	public function update(){
		var i:Int = 0;
		while (i < entity.length){
			var member = entity[i];
			if (member != null){
				if (member.active){
					member.update();
					if (!member.active){
						if (i < countEntities){
							countEntities = i;
						}
					}
				}
			}
			i++;
		}
	}

	public function render(canvas:Canvas){
		for (member in entity){
			if (member != null && member.active){
				member.render(canvas);
			}
		}
	}

	private function first():Int {
		var i = countEntities;
		while (i < entity.length + countEntities){
			var h = i % entity.length;
			if (entity[h] == null || !entity[h].active){
				if (i < entity.length){
					countEntities++;
				}
			}
			i++;
		}
		return -1;
	}

	// public function add(object:O):O {
	// 	var full:Bool = entity.length >= max;
	// 	if (!full){
	// 		entity.push(object);
	// 		return object;
	// 	} else {
	// 		var index = first();
	// 		entity[index] = object;
	// 		return object;
	// 	}
	// }

	// public function remove(object:O){
	// 	entity.remove(object);
	// }

	public function add(object:O, pos:Int = -1):Void {
		if (entity.indexOf(object) != -1) return;
		
		if (pos == -1) entity.push(object);
		else entity.insert(pos, object);
	}

	public function remove(object:O):O {
		var index = entity.indexOf(object);
		// entity[index] = null;
		entity.splice(index, 1);
		// if (index < 0) return null;
    return object;
		// var index = entity.indexOf(object);
		
		// if (index == -1) return null;

		// entity[index].deactivate();
		// entity[index] = null;
		// entity.splice(index, 1);
		
		// return object;
	}

	// public function removeEntity(object:O, splice:Bool = false):O {
	// 	var index = entity.indexOf(object);
		
	// 	if (index == -1) return null;
		
	// 	if (splice){
	// 		entity.remove(object);
	// 		entity.splice(index, 1);
	// 		// object.deactivate();
	// 	} else {
	// 		entity[index] = null;
	// 	}
		
	// 	// object.firstFrameExecuted = false;
		
	// 	return object;
	// }

	public function kill():Void {
		if (entity != null) {
			var i:Int = 0;
			var member = null;
			
			while (i < countEntities){
				member = entity[i++];
				if (member != null && member.active){
					member.kill();
				}
			}
			entity = null;
		}
	}

	// private static function resolveGroup(ObjectOrGroup:Object):Pool<Object>
	// {
	// 	var group:Pool<Object> = null;
	// 	if (ObjectOrGroup != null)
	// 	{
	// 		if (ObjectOrGroup.n4Type == GROUP)
	// 		{
	// 			group = cast ObjectOrGroup;
	// 		}
	// 		// else if (ObjectOrGroup.n4Type == SPRITEGROUP)
	// 		// {
	// 		// 	var spriteGroup:NTypedSpriteGroup<Dynamic> = cast ObjectOrGroup;
	// 		// 	group = cast spriteGroup.group;
	// 		// }
	// 	}
	// 	return group;
	// }

	public function forEachActive(action:O -> Void){
		for (m in entity){
			if (m != null && m.active){
				action(m);
			}
		}
	}
}