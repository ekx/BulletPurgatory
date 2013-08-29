package entities;

import utils.*;

import flixel.*;
import flixel.util.*;
import flixel.group.*;

class StarField extends FlxGroup
{
	public function new()
	{
		super(Constants.STARS_NUM);

		for(i in 0 ... Constants.STARS_NUM)
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