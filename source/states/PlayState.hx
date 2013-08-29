package states;

import entities.*;
import utils.*;

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
	private var player:PlayerShip;
	private var enemies:FlxGroup;
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

		Recycler.init();
		add(Recycler.extraLives);
		add(Recycler.extraBombs);
		add(Recycler.upgrades);
		
		add(Recycler.playerBullets);
		add(Recycler.enemyBullets);
		add(Recycler.explosions);

		enemies = new FlxGroup();
		add(enemies);
		player = new PlayerShip();
		add(player);		

		Reg.hud = new HUD();
		add(Reg.hud);

		Reg.score = 0;
		Reg.upgrades = 0;
		Reg.lives = Constants.NUM_LIVES;
		Reg.bombs = Constants.NUM_BOMBS;
		
		add(new Announcer("Wave 1"));

		//FlxG.debugger.visible = true;
		//FlxG.debugger.visualDebug = true;

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
		var temp:Int = FlxRandom.intRanged(0, 100);
		if(temp == 100)
			enemies.add(new SimpleEnemy());

		super.update();

		FlxG.overlap(player, Recycler.extraLives, onLifePickup);
		FlxG.overlap(player, Recycler.extraBombs, onBombPickup);
		FlxG.overlap(player, Recycler.upgrades, onUpgradePickup);
		
		FlxG.overlap(player, Recycler.enemyBullets, onPlayerHit);
		FlxG.overlap(player, enemies, onCollide);
		FlxG.overlap(enemies, Recycler.playerBullets, onEnemyHit);
	}

	private function onPlayerHit(playerRef:PlayerShip, bulletRef:FlxObject):Void	
	{
		bulletRef.kill();

		if(playerRef.hit())
			FlxG.switchState(new GameOverState());
	}

	private function onCollide(playerRef:PlayerShip, bulletRef:FlxObject):Void	
	{
		if(playerRef.hit())
			FlxG.switchState(new GameOverState());
	}

	private function onEnemyHit(enemyRef:Enemy, bulletRef:FlxObject):Void
	{
		bulletRef.kill();
		enemyRef.hit();
	}

	private function onLifePickup(playerRef:PlayerShip, extraLifeRef:FlxSprite):Void
	{
		extraLifeRef.kill();
		Reg.lives++;

		FlxG.sound.play("assets/sounds/extra-life.wav", Reg.sfxVolume);
	}
	
	private function onBombPickup(playerRef:PlayerShip, extraBombRef:FlxSprite):Void
	{
		extraBombRef.kill();
		Reg.bombs++;

		FlxG.sound.play("assets/sounds/bomb.wav", Reg.sfxVolume);
	}

	private function onUpgradePickup(playerRef:PlayerShip, upgradeRef:FlxSprite):Void
	{
		upgradeRef.kill();
		Reg.upgrades++;

		FlxG.sound.play("assets/sounds/powerup.wav", Reg.sfxVolume);
	}
}