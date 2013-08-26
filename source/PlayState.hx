package ;

import flixel.*;
import flixel.group.*;
import flixel.text.*;
import flixel.ui.*;
import flixel.util.*;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private static var NUM_PLAYER_BULLETS:Int = 150;
	private static var NUM_ENEMY_BULLETS:Int = 400;

	private var player:PlayerShip;
	public var playerBullets:FlxGroup;

	private var enemies:FlxGroup;
	public var enemyBullets:FlxGroup;

	private var starField:StarField;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		// Set a background color
		FlxG.cameras.bgColor = 0xff131c1b;

		starField = new StarField();
		add(starField);

		player = new PlayerShip();
		add(player);

		var sprite:FlxSprite;

		playerBullets = new FlxGroup(NUM_PLAYER_BULLETS);
		
		for(i in 0 ... NUM_PLAYER_BULLETS)			
		{
			sprite = new FlxSprite( -100, -100);	
			sprite.loadGraphic("assets/images/shot.png");		
			sprite.exists = false;
			playerBullets.add(sprite);			
		}
		
		add(playerBullets);

		enemies = new FlxGroup();
		add(enemies);

		enemyBullets = new FlxGroup(NUM_ENEMY_BULLETS);
		
		for(i in 0 ... NUM_ENEMY_BULLETS)			
		{
			sprite = new FlxSprite( -100, -100);	
			sprite.loadGraphic("assets/images/enemy_shot.png");		
			sprite.exists = false;
			enemyBullets.add(sprite);			
		}
		
		add(enemyBullets);

		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		var temp:Int = FlxRandom.intRanged(0, 25);
		if(temp == 25)
			enemies.add(new SimpleEnemy());

		super.update();

		FlxG.overlap(player, enemyBullets, onPlayerHit);
		FlxG.overlap(enemies, playerBullets, onEnemyHit);
	}

	private function onPlayerHit(playerRef:PlayerShip, bulletRef:FlxObject):Void	
	{
		bulletRef.kill();

		if(playerRef.hit())
			FlxG.game.state = new GameOverState();
	}

	private function onEnemyHit(enemyRef:Enemy, bulletRef:FlxObject):Void
	{
		bulletRef.kill();
		enemyRef.hit();
	}
}