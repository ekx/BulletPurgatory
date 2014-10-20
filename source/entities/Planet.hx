package entities;

import utils.*;

import flixel.*;
import flixel.util.*;

import flash.geom.*;

class Planet extends FlxSprite
{
	public function new() 
	{
		super(-100, -100);
		loadGraphic("assets/images/planet.png", false, 128, 128);
		animation.add("0", [0]);
		animation.add("1", [1]);
		animation.add("2", [2]);
		exists = false;
	}
	
	public function init():Void {
		animation.play(Std.string(FlxRandom.intRanged(0, 2)));
		color = (FlxRandom.intRanged(0, 255) * 0x10000) + (FlxRandom.intRanged(0, 255) * 0x100) + FlxRandom.intRanged(0, 255);
		alpha = 0.6;

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