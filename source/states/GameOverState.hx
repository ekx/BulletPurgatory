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
		
		gameOverText = new FlxText(0, FlxG.height / 4, FlxG.width, "GAME OVER", 50);
		gameOverText.font = Constants.FONT;
		gameOverText.alignment = "center";
		add(gameOverText);
		
		scoreText = new FlxText(0, FlxG.height / 2, FlxG.width, "You scored " + Reg.score + " Points", 20);
		scoreText.font = Constants.FONT;
		scoreText.alignment = "center";
		add(scoreText);
		
		restartText = new FlxText(0, FlxG.height / 2 + 40, FlxG.width, "To restart press Enter or Start", 20);
		restartText.font = Constants.FONT;
		restartText.alignment = "center";
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
		
		if(FlxG.keyboard.justPressed("ENTER") || Reg.controller.justPressed(Controller.START)) {
			FlxG.switchState(new PlayState());
		}

		Reg.controller.poll();
	}	
}