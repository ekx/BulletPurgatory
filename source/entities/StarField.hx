package entities;

import flixel.*;
import flixel.util.*;
import flixel.group.*;

class StarField extends FlxGroup
{
	private static var NUM_STARS:Int = 50;

	public function new()
	{
		super(NUM_STARS);

		for(i in 0 ... NUM_STARS)
			add(new Star());
	}

	override public function update()
	{
		var temp:Int = FlxRandom.intRanged(0, 5);
		if(temp == 5) {
			cast(recycle(), Star).init();
		}

		super.update();
	}
}