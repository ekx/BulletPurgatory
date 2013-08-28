package utils;

import entities.*;

import flixel.*;
import flixel.group.*;

class Recycler 
{
	private static var NUM_PLAYER_BULLETS:Int = 150;
	private static var NUM_ENEMY_BULLETS:Int = 400;
	private static var NUM_EXPLOSIONS:Int = 50;
	private static var NUM_EXTRA_LIVES:Int = 10;
	private static var NUM_UPGRADES:Int = 10;

	public static var playerBullets:FlxGroup;
	public static var enemyBullets:FlxGroup;
	public static var explosions:FlxGroup;
	public static var extraLives:FlxGroup;
	public static var upgrades:FlxGroup;

	public static function init():Void
	{
		var sprite:FlxSprite;

		playerBullets = new FlxGroup(NUM_PLAYER_BULLETS);
		
		for(i in 0 ... NUM_PLAYER_BULLETS) {
			sprite = new FlxSprite( -100, -100, "assets/images/shot.png");		
			sprite.exists = false;
			playerBullets.add(sprite);			
		}

		enemyBullets = new FlxGroup(NUM_ENEMY_BULLETS);
		
		for(i in 0 ... NUM_ENEMY_BULLETS) {
			sprite = new FlxSprite( -100, -100, "assets/images/enemy_shot.png");	
			sprite.exists = false;
			enemyBullets.add(sprite);			
		}

		explosions = new FlxGroup(NUM_EXPLOSIONS);

		for(i in 0 ... NUM_EXPLOSIONS) {
			sprite = new Explosion();
			explosions.add(sprite);
		}

		extraLives = new FlxGroup(NUM_EXTRA_LIVES);

		for(i in 0 ... NUM_EXTRA_LIVES) {
			sprite = new FlxSprite(-100, -100, "assets/images/extra-life.png");
			sprite.exists = false;
			extraLives.add(sprite);
		}

		upgrades = new FlxGroup(NUM_UPGRADES);

		for(i in 0 ... NUM_UPGRADES) {
			sprite = new FlxSprite(-100, -100, "assets/images/upgrade.png");
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
		temp.velocity.y = 40;
	}

	public static function spawnUpgrade(locX:Float, locY:Float):Void
	{
		var temp:FlxSprite = cast(upgrades.recycle(), FlxSprite);
		
		temp.reset(locX - temp.width/2, locY - temp.height/2);
		temp.velocity.y = 40;
	}
}