// tode
// Lewis Lepton
// https://lewislepton.com

package tode;

/*
@uthor lewis lepton 2020
https://lewislepton.com
*/

import nape.callbacks.CbType;
import nape.callbacks.InteractionType;
import nape.callbacks.PreCallback;
import nape.callbacks.PreFlag;
import nape.callbacks.PreListener;

import tode.World;

class OneWay {
	public static var type:CbType;
	
	public static function setup(){
		type = new CbType();
		World.space.listeners.add(new PreListener(InteractionType.COLLISION, type, CbType.ANY_BODY, oneWayHandler, 0, true));
	}

	static function oneWayHandler(callback:PreCallback):PreFlag {
		var col = callback.arbiter.collisionArbiter;
		if ((col.normal.y > 0) != callback.swapped) {
			return PreFlag.IGNORE;
		}	else {
			return PreFlag.ACCEPT;
		}
	}
}