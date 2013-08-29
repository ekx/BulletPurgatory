package entities;

import states.*;
import utils.*;

import flixel.*;
import flixel.util.*;

class Enemy extends FlxSprite
{
	private var hitTimer:Int = 0;

	private var hitPoints:Int = 1;
	private var scoreValue:Int = 1;

	private var hasExtraLife:Bool = false;
	private var hasExtraBomb:Bool = false;
	private var hasUpgrade:Bool = false;

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

	public function hit(damage:Int = 1):Void
	{
		if(hitTimer > 0)
			return;

		hitPoints -= damage;

		if(hitPoints > 0) {
			hitTimer = Constants.ENEMY_HIT_TIMEOUT;
			FlxG.sound.play("assets/sounds/hit.wav", Reg.sfxVolume);
		}
		else {
			Reg.score += scoreValue;
			
			Recycler.spawnExplosion(getMidpoint().x, getMidpoint().y);

			if(hasExtraLife) {
				Recycler.spawnExtraLife(getMidpoint().x, getMidpoint().y);
			}
			if(hasExtraBomb) {
				Recycler.spawnExtraBomb(getMidpoint().x, getMidpoint().y);
			}
			if(hasUpgrade) {
				Recycler.spawnUpgrade(getMidpoint().x, getMidpoint().y);
			}

			kill();
		}
	}

	private function shoot(speed:Int, direction:Int):Void
	{
		var bullet:FlxSprite = Recycler.getEnemyBullet();
		bullet.reset(x + width/2 - bullet.width/2, y + height/2 - bullet.height/2);
		bullet.angle = direction;

		bullet.velocity.y = speed * Math.cos(degToRad(180 - direction));
		bullet.velocity.x = speed * Math.sin(degToRad(180 - direction));
	}

	private function degToRad(deg:Int):Float
	{
	    return Math.PI / 180 * deg;
	}
}