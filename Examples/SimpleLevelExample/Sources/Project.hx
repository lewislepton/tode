package;

import tode.App;
import tode.State;

import state.MenuState;
import state.PlayState;
import state.OptionState;
import state.RetryState;

// here we put in our states. so any extra level/states, they go in here. same setup as the others.

class Project extends App {
	public function new(){
		super();
		State.addState('menu', new MenuState());
		State.addState('play', new PlayState());
		State.addState('option', new OptionState());
		State.addState('retry', new RetryState());
		State.set('play');
	}
}