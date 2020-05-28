// tode
// Lewis Lepton
// https://lewislepton.com

package tode;

/*
@uthor lewis lepton 2018
https://lewislepton.com
*/

import nape.callbacks.InteractionListener;
import nape.callbacks.InteractionType;
import nape.callbacks.InteractionCallback;
import nape.callbacks.CbEvent;
import nape.callbacks.CbType;

import tode.World;

/*
COLLISION CHEAT SHEET
1:- collision - tested
2:- sensor - tested
3:- fluid - not tested
4:- any - not tested
*/

class Listen {
	var listen:InteractionListener;
	public var collision:CbType = new CbType();
	public var hasCollided:Bool = false;
	public var hasSensored:Bool = false;

	public function new(cbType:Int){
		switch (cbType){
			case 1: listen = new InteractionListener(CbEvent.BEGIN, InteractionType.COLLISION, collision, collision, contact);
			case 2: listen = new InteractionListener(CbEvent.BEGIN, InteractionType.SENSOR, collision, collision, sensor);
			case 3: listen = new InteractionListener(CbEvent.BEGIN, InteractionType.FLUID, collision, collision, contact);
			case 4: listen = new InteractionListener(CbEvent.BEGIN, InteractionType.ANY, collision, collision, sensor);
		default: return;
		}
		World.space.listeners.add(listen);
	}

	function contact(collide:InteractionCallback){
		hasCollided = true;
	}

	function sensor(collide:InteractionCallback){
		hasSensored = true;
	}
}