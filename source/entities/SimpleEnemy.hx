package entities;

import flixel.*;
import flixel.util.*;

class SimpleEnemy extends Enemy
{
	private static var SHOOT_TIMER:Int = 50;
	private var shootTimer:Int = 0;

	public function new()
	{
		super();

		hitPoints = 2;
		scoreValue = 50;
		
		loadGraphic("assets/images/simple_enemy.png");

		x = FlxRandom.intRanged(0, cast(FlxG.width - width, Int));
		y = 0 - height;

		velocity.y = 80;
	}

	override public function update():Void
	{
		super.update();

		shootTimer++;

		if(shootTimer == SHOOT_TIMER) {
			shootTimer = 0;
			shoot(150, 135);
			shoot(150, 225);
		}
	}
}