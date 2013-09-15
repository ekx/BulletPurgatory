package entities;

import utils.*;

import flixel.*;

class Bomb extends FlxSprite
{
	private var ttl:Int;

	public function new()
	{
		super(-100, -100);
		exists = false;
	}

	override public function reset(X:Float, Y:Float):Void {
		super.reset(X, Y);

		FlxG.sound.play("assets/sounds/bomb-explosion.wav", Reg.sfxVolume);

		Recycler.enemyBullets.kill();
				
		for(i in 0 ... Reg.enemies.length) {
			cast(Reg.enemies.members[i], Enemy).hit(10);
		}
		Reg.enemies.kill();

		ttl = Constants.PLAYER_BOMB_TIMEOUT;
	}

	override public function update():Void
	{
		super.update();

		if(ttl > Constants.PLAYER_BOMB_TIMEOUT - 1)
			makeGraphic(FlxG.width, FlxG.height, 0x11FFFFFF);
		else if(ttl > Constants.PLAYER_BOMB_TIMEOUT - 2)
			makeGraphic(FlxG.width, FlxG.height, 0x22FFFFFF);
		else if(ttl > Constants.PLAYER_BOMB_TIMEOUT - 3)
			makeGraphic(FlxG.width, FlxG.height, 0x33FFFFFF);
		else if(ttl > Constants.PLAYER_BOMB_TIMEOUT - 4)
			makeGraphic(FlxG.width, FlxG.height, 0x44FFFFFF);
		else if(ttl > Constants.PLAYER_BOMB_TIMEOUT - 5)
			makeGraphic(FlxG.width, FlxG.height, 0x55FFFFFF);
		else if(ttl > Constants.PLAYER_BOMB_TIMEOUT - 6)
			makeGraphic(FlxG.width, FlxG.height, 0x66FFFFFF);
		else if(ttl > Constants.PLAYER_BOMB_TIMEOUT - 7)
			makeGraphic(FlxG.width, FlxG.height, 0x77FFFFFF);
		else if(ttl > Constants.PLAYER_BOMB_TIMEOUT - 8)
			makeGraphic(FlxG.width, FlxG.height, 0x88FFFFFF);
		else if(ttl > Constants.PLAYER_BOMB_TIMEOUT - 9)
			makeGraphic(FlxG.width, FlxG.height, 0x99FFFFFF);
		else if(ttl > Constants.PLAYER_BOMB_TIMEOUT - 10)
			makeGraphic(FlxG.width, FlxG.height, 0xAAFFFFFF);
		else if(ttl > Constants.PLAYER_BOMB_TIMEOUT - 11)
			makeGraphic(FlxG.width, FlxG.height, 0xBBFFFFFF);
		else if(ttl > Constants.PLAYER_BOMB_TIMEOUT - 12)
			makeGraphic(FlxG.width, FlxG.height, 0xCCFFFFFF);
		else if(ttl > Constants.PLAYER_BOMB_TIMEOUT - 13)
			makeGraphic(FlxG.width, FlxG.height, 0xDDFFFFFF);
		else if(ttl > Constants.PLAYER_BOMB_TIMEOUT - 14)
			makeGraphic(FlxG.width, FlxG.height, 0xEEFFFFFF);
		else if(ttl > Constants.PLAYER_BOMB_TIMEOUT - 15)
			makeGraphic(FlxG.width, FlxG.height, 0xFFFFFFFF);

		else if(ttl == 14)
			makeGraphic(FlxG.width, FlxG.height, 0xEEFFFFFF);
		else if(ttl == 13)
			makeGraphic(FlxG.width, FlxG.height, 0xDDFFFFFF);
		else if(ttl == 12)
			makeGraphic(FlxG.width, FlxG.height, 0xCCFFFFFF);
		else if(ttl == 11)
			makeGraphic(FlxG.width, FlxG.height, 0xBBFFFFFF);
		else if(ttl == 10)
			makeGraphic(FlxG.width, FlxG.height, 0xAAFFFFFF);
		else if(ttl == 9)
			makeGraphic(FlxG.width, FlxG.height, 0x99FFFFFF);
		else if(ttl == 8)
			makeGraphic(FlxG.width, FlxG.height, 0x88FFFFFF);
		else if(ttl == 7)
			makeGraphic(FlxG.width, FlxG.height, 0x77FFFFFF);
		else if(ttl == 6)
			makeGraphic(FlxG.width, FlxG.height, 0x66FFFFFF);
		else if(ttl == 5)
			makeGraphic(FlxG.width, FlxG.height, 0x55FFFFFF);
		else if(ttl == 4)
			makeGraphic(FlxG.width, FlxG.height, 0x44FFFFFF);
		else if(ttl == 3)
			makeGraphic(FlxG.width, FlxG.height, 0x33FFFFFF);
		else if(ttl == 2)
			makeGraphic(FlxG.width, FlxG.height, 0x22FFFFFF);
		else if(ttl == 1)
			makeGraphic(FlxG.width, FlxG.height, 0x11FFFFFF);
		
		ttl--;

		if(exists && ttl == 0) {
			Recycler.enemyBullets.revive();
			Reg.enemies.revive();
			kill();
		}
	}
}