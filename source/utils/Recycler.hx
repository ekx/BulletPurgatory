package utils;

import entities.*;
import utils.*;

import flixel.*;
import flixel.group.*;

class Recycler 
{
	public static var playerBullets:FlxGroup;
	public static var enemyBullets:FlxGroup;
	public static var explosions:FlxGroup;
	
	public static var extraLives:FlxGroup;
	public static var extraBombs:FlxGroup;
	public static var upgrades:FlxGroup;

	public static function init():Void
	{
		var sprite:FlxSprite;

		playerBullets = new FlxGroup(Constants.NUM_PLAYER_BULLETS);
		
		for(i in 0 ... Constants.NUM_PLAYER_BULLETS) {
			sprite = new FlxSprite( -100, -100, "assets/images/shot.png");
			sprite.exists = false;
			playerBullets.add(sprite);			
		}

		enemyBullets = new FlxGroup(Constants.NUM_ENEMY_BULLETS);
		
		for(i in 0 ... Constants.NUM_ENEMY_BULLETS) {
			sprite = new FlxSprite( -100, -100, "assets/images/enemy_shot.png");
			sprite.width = sprite.height = Constants.ENEMY_BULLET_SIZE;
			sprite.centerOffsets();
			sprite.exists = false;
			enemyBullets.add(sprite);			
		}

		explosions = new FlxGroup(Constants.NUM_EXPLOSIONS);

		for(i in 0 ... Constants.NUM_EXPLOSIONS) {
			sprite = new Explosion();
			explosions.add(sprite);
		}

		extraLives = new FlxGroup(Constants.NUM_EXTRA_LIVES);

		for(i in 0 ... Constants.NUM_EXTRA_LIVES) {
			sprite = new FlxSprite(-100, -100, "assets/images/life-pickup.png");
			sprite.exists = false;
			extraLives.add(sprite);
		}
		
		extraBombs = new FlxGroup(Constants.NUM_EXTRA_BOMBS);

		for(i in 0 ... Constants.NUM_EXTRA_BOMBS) {
			sprite = new FlxSprite(-100, -100, "assets/images/bomb-pickup.png");
			sprite.exists = false;
			extraBombs.add(sprite);
		}

		upgrades = new FlxGroup(Constants.NUM_UPGRADES);

		for(i in 0 ... Constants.NUM_UPGRADES) {
			sprite = new FlxSprite(-100, -100, "assets/images/power-pickup.png");
			sprite.exists = false;
			upgrades.add(sprite);
		}
	}

	public static function getPlayerBullet():FlxSprite
	{
		return cast(playerBullets.recycle(), FlxSprite);
	}

	public static function getEnemyBullet():FlxSprite
	{
		return cast(enemyBullets.recycle(), FlxSprite);
	}

	public static function spawnExplosion(locX:Float, locY:Float):Void
	{
		var temp:Explosion = cast(explosions.recycle(), Explosion);
		temp.reset(locX, locY);
	}

	public static function spawnExtraLife(locX:Float, locY:Float):Void
	{
		var temp:FlxSprite = cast(extraLives.recycle(), FlxSprite);

		temp.reset(locX - temp.width/2, locY - temp.height/2);
		temp.velocity.y = Constants.PICKUP_SPEED;
	}
	
	public static function spawnExtraBomb(locX:Float, locY:Float):Void
	{
		var temp:FlxSprite = cast(extraBombs.recycle(), FlxSprite);

		temp.reset(locX - temp.width/2, locY - temp.height/2);
		temp.velocity.y = Constants.PICKUP_SPEED;
	}

	public static function spawnUpgrade(locX:Float, locY:Float):Void
	{
		var temp:FlxSprite = cast(upgrades.recycle(), FlxSprite);
		
		temp.reset(locX - temp.width/2, locY - temp.height/2);
		temp.velocity.y = Constants.PICKUP_SPEED;
	}
}