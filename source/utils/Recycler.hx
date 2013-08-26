package utils;

import entities.*;

import flixel.*;
import flixel.group.*;

class Recycler 
{
	private static var NUM_PLAYER_BULLETS:Int = 150;
	private static var NUM_ENEMY_BULLETS:Int = 400;
	private static var NUM_EXPLOSIONS:Int = 50;

	public static var playerBullets:FlxGroup;
	public static var enemyBullets:FlxGroup;
	public static var explosions:FlxGroup;

	public static function init():Void
	{
		var sprite:FlxSprite;

		playerBullets = new FlxGroup(NUM_PLAYER_BULLETS);
		
		for(i in 0 ... NUM_PLAYER_BULLETS) {
			sprite = new FlxSprite( -100, -100);	
			sprite.loadGraphic("assets/images/shot.png");		
			sprite.exists = false;
			playerBullets.add(sprite);			
		}

		enemyBullets = new FlxGroup(NUM_ENEMY_BULLETS);
		
		for(i in 0 ... NUM_ENEMY_BULLETS) {
			sprite = new FlxSprite( -100, -100);	
			sprite.loadGraphic("assets/images/enemy_shot.png");		
			sprite.exists = false;
			enemyBullets.add(sprite);			
		}

		explosions = new FlxGroup(NUM_EXPLOSIONS);

		for(i in 0 ... NUM_EXPLOSIONS) {
			sprite = new Explosion();
			explosions.add(sprite);
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

	public static function getExplosion():Explosion
	{
		return cast(explosions.recycle(), Explosion);
	}
}