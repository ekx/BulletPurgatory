package entities;

import states.*;
import utils.*;

import flixel.*;

class PlayerShip extends FlxSprite
{
	private var shotTimer:Int = Constants.PLAYER_SHOT_TIMEOUT;
	private var bombTimer:Int = Constants.PLAYER_BOMB_TIMEOUT;

	private var hitTimer:Int = Constants.PLAYER_HIT_TIMEOUT;

	public function new()
	{		
		super(FlxG.width / 2 - 16, FlxG.height - 50);

		loadGraphic("assets/images/ship.png", true, false, 32, 48);
		animation.add("idle", [0]);
		animation.add("flight", [1, 2, 3], 8, true);

		animation.play("flight");
		
		width = 10;
		height = 10;
		centerOffsets();
	}

	override public function update():Void
	{
		velocity.x = 0;
		velocity.y = 0;

		//Horizontal movement
		if(FlxG.keyboard.pressed("LEFT", "A") || Reg.controller.leftPressed()) {
			velocity.x -= Constants.PLAYER_HORIZONTAL_SPEED;		
		}
		else if(FlxG.keyboard.pressed("RIGHT", "D") || Reg.controller.rightPressed()) {
			velocity.x += Constants.PLAYER_HORIZONTAL_SPEED;		
		}

		//Vertical movement
		if(FlxG.keyboard.pressed("UP", "W") || Reg.controller.upPressed()) {
			velocity.y -= Constants.PLAYER_VERTICAL_SPEED;		
		}
		else if(FlxG.keyboard.pressed("DOWN", "S") || Reg.controller.downPressed()) {
			velocity.y += Constants.PLAYER_VERTICAL_SPEED;		
		}

		//Horizontal borders
		if(x > FlxG.width - width - Constants.SCREEN_BOUNDARY_PADDING) {
			x = FlxG.width - width - Constants.SCREEN_BOUNDARY_PADDING; 
		}
		else if(x < Constants.SCREEN_BOUNDARY_PADDING){
			x = Constants.SCREEN_BOUNDARY_PADDING;					
		}

		//Vertical borders
		if(y > FlxG.height - height - Constants.SCREEN_BOUNDARY_PADDING) {
			y = FlxG.height - height - Constants.SCREEN_BOUNDARY_PADDING; 
		}
		else if(y < Constants.SCREEN_BOUNDARY_PADDING){
			y = Constants.SCREEN_BOUNDARY_PADDING;					
		}

		//Shooting
		if((FlxG.keyboard.pressed("SPACE") || Reg.controller.pressed(Controller.A)) && shotTimer == 0)
		{
			FlxG.sound.play("assets/sounds/shot.wav", Reg.sfxVolume);
			shotTimer = Constants.PLAYER_SHOT_TIMEOUT;

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
		}

		//Bomb
		if((FlxG.keyboard.pressed("ALT") || Reg.controller.pressed(Controller.X)) && bombTimer == 0 && Reg.bombs > 0) {
			Reg.bombs--;
			bombTimer = Constants.PLAYER_BOMB_TIMEOUT;

			Reg.bomb.reset(0, 0);
		}

		if(shotTimer > 0)
			shotTimer--;
		if(bombTimer > 0)
			bombTimer--;

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

		hitTimer = Constants.PLAYER_HIT_TIMEOUT;

		Recycler.spawnExplosion(getMidpoint().x, getMidpoint().y);

		if(Reg.upgrades > 0)
			Reg.upgrades--;

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