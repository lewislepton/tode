// tode
// Lewis Lepton
// https://lewislepton.com

package tode;

/*
@uthor lewis lepton 2020
https://lewislepton.com
*/

import nape.phys.Body;
import haxe.ds.ArraySort;
import kha.Canvas;
import tode.Object;

class Scene {  
	public var count(get, null):Int;

  private var _depth:Bool;
  private var _objects:Array<Object>;

  public function new(){
    _objects = new Array<Object>();
  }

  /**
   * update objects added in scene
   */
  public function update(){
    for (entity in _objects) entity.update();
  }

  /**
   * render objects added to scene
   * @param canvas 
   */
  public function render(canvas:Canvas){
    if (_depth) depth(_objects);

    for (entity in _objects) entity.render(canvas);
  }

  public function get_count():Int {
    return _objects.length;
  }

  /**
   * clear objects from scene
   */
  public function clear(){
    _objects = new Array<Object>();
  }

  /**
   * add object to scene
   * @param entity 
   */
  public function add(object:Object){
    object.active = true;
    _objects.push(object);
  }

  /**
   * remove object from scene
   * @param entity 
   */
  public function remove(entity:Object){
    entity.active = false;
    _objects.remove(entity);
    entity = null;
  }

  function depth(entities:Array<Object>){
    if (entities.length == 0) return;
    ArraySort.sort(entities, function(ent1:Object, ent2:Object){
      if (ent1.body.position.y + ent1.body.position.y < ent2.body.position.y + ent2.body.position.y){
        return -1;
      } else if (ent1.body.position.y == ent2.body.position.y){
        return 0;
      } else {
        return 1;
      }
    });
  }

  /**
   * sort depth
   * @param value 
   * @return Bool
   */
  public function sort(?value:Bool = false):Bool {
    return _depth = value;
  }
}