package entities;

import utils.*;

import flash.Lib;
import flixel.*;
import flixel.util.*;

class Star extends FlxSprite
{
	public function new()
	{
		super(-100, -100);
		exists = false;
	}

	public function init()
	{
		var width:Int = FlxRandom.intRanged(1, 3);
		var height:Int = FlxRandom.intRanged(4, 9);

		makeGraphic(width, height);

		x = FlxRandom.intRanged(0, FlxG.width);
		y = 0 - height;

		reset(x, y);

		velocity.y = Constants.STARS_SPEED + FlxRandom.intRanged(0, 20);
	}

	override public function update():Void
	{
		if(y > FlxG.height) {
			kill();
		}

		super.update();
	}
}