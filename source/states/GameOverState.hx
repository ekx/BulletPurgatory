package states;

import utils.*;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class GameOverState extends FlxState
{
	private var gameOverText:FlxText;
	private var scoreText:FlxText;
	private var restartText:FlxText;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		// Set a background color
		FlxG.cameras.bgColor = 0xff131c1b;
		
		gameOverText = new FlxText(FlxG.width / 2 - 170, FlxG.height / 2 - 25, 400, "GAME OVER", 50);
		add(gameOverText);
		
		scoreText = new FlxText(FlxG.width / 2 - 150, FlxG.height / 2 + 125, 400, "You scored " + Reg.score + " Points", 20);
		add(scoreText);
		
		restartText = new FlxText(FlxG.width / 2 - 150, FlxG.height / 2 + 165, 400, "To restart press Enter", 20);
		add(restartText);
		
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
		super.update();
		
		if(FlxG.keyboard.anyJustPressed(["ENTER"])) {
			FlxG.switchState(new PlayState());
		}
	}	
}