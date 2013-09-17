package entities;

import utils.*;

import flixel.*;
import flixel.util.*;

class Planet extends FlxSprite
{
	public function new() 
	{
		super(-100, -100);
		
		loadGraphic("assets/images/planet.png", true);
		exists = false;
	}
	
	public function init():Void {
		x = FlxRandom.intRanged(0, Std.int(FlxG.width - width));
		y = 0 - height;
	
		reset(x, y);

		velocity.y = Constants.PLANETS_SPEED + FlxRandom.intRanged(0, 5);
	}
	
	override public function update():Void
	{
		super.update();
		
		if(exists && y > FlxG.height)
			kill();
	}
}