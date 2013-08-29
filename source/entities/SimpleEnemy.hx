package entities;

import utils.*;

import flixel.*;
import flixel.util.*;

class SimpleEnemy extends Enemy
{
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

		switch(FlxRandom.intRanged(0, 10)) {
			case 8:
				hasExtraBomb = true;
			case 9:
				hasExtraLife = true;
			case 10:
				hasUpgrade = true;
		}
	}

	override public function update():Void
	{
		super.update();

		shootTimer++;

		if(shootTimer == Constants.SIMPLE_ENEMY_SHOOT_TIMER) {
			shootTimer = 0;
			shoot(150, 135);
			shoot(150, 225);
		}
	}
}