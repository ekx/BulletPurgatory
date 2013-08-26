package ;

import flixel.*;
import flixel.util.*;

class SimpleEnemy extends Enemy
{
	public function new()
	{
		super();

		hitPoints = 1;
		scoreValue = 50;
		
		loadGraphic("assets/images/simple_enemy.png");

		x = FlxRandom.intRanged(0, FlxG.width);
		y = 0 - height;

		velocity.y = 20;
	}

	override public function update():Void
	{
		super.update();
	}
}