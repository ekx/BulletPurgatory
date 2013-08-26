package entities;

import states.*;
import utils.*;

import flixel.*;
import flixel.util.*;

class Enemy extends FlxSprite
{
	private static var HIT_TIMEOUT:Int = 10;
	private var hitTimer:Int = 0;

	private var hitPoints:Int = 1;
	private var scoreValue:Int = 1;

	public function new()
	{
		super();
	}

	override public function update():Void
	{
		super.update();

		if(hitTimer > 0) {
			color = 0x78ff0000;
			hitTimer--;

			if(hitTimer == 0)
				color = 0x00ffffff;
		}
	}

	public function hit():Void
	{
		if(hitTimer > 0)
			return;

		hitPoints--;

		if(hitPoints > 0) {
			hitTimer = HIT_TIMEOUT;
			FlxG.sound.play("assets/sounds/hit.wav", Reg.sfxVolume);
		}
		else {
			Reg.score += scoreValue;
			
			var exp:Explosion = Recycler.getExplosion();
			exp.reset(getMidpoint().x, getMidpoint().y);

			kill();
		}
	}

	private function shoot(velX:Int, velY:Int):Void
	{
		var bullet:FlxSprite = Recycler.getEnemyBullet();
		bullet.reset(x + width/2 - bullet.width/2, y);
		bullet.velocity.y = velY;
		bullet.velocity.x = velX;
	}
}