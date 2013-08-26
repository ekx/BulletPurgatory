package entities;

import states.*;
import utils.*;

import flixel.*;

class PlayerShip extends FlxSprite
{
	private static var HORIZONTAL_SPEED:Int = 300;
	private static var VERTICAL_SPEED:Int = 200;

	private static var PADDING:Int = 4;

	private static var SHOT_TIMEOUT:Int = 10;
	private var shotTimer:Int = 0;

	private static var HIT_TIMEOUT:Int = 200;
	private var hitTimer:Int = 0;

	public function new()
	{
		super(FlxG.width / 2 - 16, FlxG.height - 50, "assets/images/ship.png");
	}

	override public function update():Void
	{
		velocity.x = 0;
		velocity.y = 0;

		//Horizontal movement
		if(FlxG.keyboard.pressed("LEFT", "A")) {
			velocity.x -= HORIZONTAL_SPEED;		
		}
		else if(FlxG.keyboard.pressed("RIGHT", "D")) {
			velocity.x += HORIZONTAL_SPEED;		
		}

		//Vertical movement
		if(FlxG.keyboard.pressed("UP", "W")) {
			velocity.y -= VERTICAL_SPEED;		
		}
		else if(FlxG.keyboard.pressed("DOWN", "S")) {
			velocity.y += VERTICAL_SPEED;		
		}

		//Horizontal borders
		if(x > FlxG.width - width - PADDING) {
			x = FlxG.width - width - PADDING; 
		}
		else if(x < PADDING){
			x = PADDING;					
		}

		//Vertical borders
		if(y > FlxG.height - height - PADDING) {
			y = FlxG.height - height - PADDING; 
		}
		else if(y < PADDING){
			y = PADDING;					
		}

		//Shooting
		if(FlxG.keyboard.pressed("SPACE") && shotTimer == 0)
		{
			FlxG.sound.play("assets/sounds/shot.wav", Reg.sfxVolume);
			
			shoot(0, -391);

			if(Reg.upgrades >= 1) {
				shoot(-20, -390);
				shoot(20, -390);
			}

			if(Reg.upgrades >= 2) {
				shoot(-40, -388);
				shoot(40, -388);
			}

			if(Reg.upgrades >= 3) {
				shoot(-60, -384);
				shoot(60, -384);
			}

			if(Reg.upgrades >= 4) {
				shoot(-80, -378);
				shoot(80, -378);
			}

			if(Reg.upgrades >= 5) {
				shoot(-100, -370);
				shoot(100, -370);
			}

			shotTimer = SHOT_TIMEOUT;
		}

		if(shotTimer > 0)
			shotTimer--;

		if(hitTimer > 0) {
			hitTimer--;

			if(hitTimer % 10 == 0) alpha = 1;
			if(hitTimer % 10 == 1) alpha = 0.9;
			if(hitTimer % 10 == 2) alpha = 0.8;
			if(hitTimer % 10 == 3) alpha = 0.7;
			if(hitTimer % 10 == 4) alpha = 0.6;
			if(hitTimer % 10 == 5) alpha = 0.5;
			if(hitTimer % 10 == 6) alpha = 0.4;
			if(hitTimer % 10 == 7) alpha = 0.3;
			if(hitTimer % 10 == 8) alpha = 0.2;
			if(hitTimer % 10 == 9) alpha = 0.1;
		}

		super.update();
	}

	public function hit():Bool
	{
		if(hitTimer > 0)
			return false;

		hitTimer = HIT_TIMEOUT;

		var exp:Explosion = Recycler.getExplosion();
		exp.reset(getMidpoint().x, getMidpoint().y);

		if(Reg.lives > 0) {
			Reg.lives--;
			reset(FlxG.width / 2 - 16, FlxG.height - 50);
			return false;
		}
		else {
			return true;
		}
	}

	private function shoot(velX:Int, velY:Int):Void
	{
		var bullet:FlxSprite = Recycler.getPlayerBullet();
		bullet.reset(x + width/2 - bullet.width/2, y);
		bullet.velocity.y = velY;
		bullet.velocity.x = velX;
	}
}