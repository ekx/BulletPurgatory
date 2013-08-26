package ;

import flixel.*;

class PlayerShip extends flixel.FlxSprite
{
	private static var HORIZONTAL_SPEED:Int = 300;
	private static var VERTICAL_SPEED:Int = 200;

	private static var PADDING:Int = 4;

	private static var SHOT_TIMEOUT:Int = 10;
	private var shotTimer:Int = 0;

	private static var HIT_TIMEOUT:Int = 2000;
	private var hitTimer:Int = 0;

	private var lives:Int = 3;
	private var upgradeLevel:Int = 0;

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
			FlxG.sound.play("assets/sounds/shot.wav");
			
			shoot(0, -391);

			if(upgradeLevel >= 1) {
				shoot(-20, -390);
				shoot(20, -390);
			}

			if(upgradeLevel >= 2) {
				shoot(-40, -388);
				shoot(40, -388);
			}

			if(upgradeLevel >= 3) {
				shoot(-60, -384);
				shoot(60, -384);
			}

			if(upgradeLevel >= 4) {
				shoot(-80, -378);
				shoot(80, -378);
			}

			if(upgradeLevel >= 5) {
				shoot(-100, -370);
				shoot(100, -370);
			}

			shotTimer = SHOT_TIMEOUT;
		}

		if(shotTimer > 0)
			shotTimer--;

		if(hitTimer > 0)
			hitTimer--;
		
		super.update();
	}

	public function hit():Bool
	{
		if(hitTimer > 0)
			return false;

		hitTimer = HIT_TIMEOUT;

		lives--;

		FlxG.sound.play("assets/sounds/hit.wav");
		play("explosion");

		if(lives > 0) {
			//reset
			return false;
		}
		else {
			return true;
		}
	}

	private function shoot(velX:Int, velY:Int):Void
	{
		var bullet:FlxSprite = cast(cast(FlxG.state, PlayState).playerBullets.recycle(), FlxSprite);
		bullet.reset(x + width/2 - bullet.width/2, y);
		bullet.velocity.y = velY;
		bullet.velocity.x = velX;
	}
}