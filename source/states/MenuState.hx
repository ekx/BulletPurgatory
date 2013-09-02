package states;

import utils.*;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flash.system.System;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	private var title:FlxText;
	
	private var newGame:FlxText;
	private var options:FlxText;
	private var exit:FlxText;
	
	private var selection:Int = 0;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		Reg.controller = new Controller();
		
		// Set a background color
		FlxG.cameras.bgColor = 0xff131c1b;
		
		title = new FlxText(0, FlxG.height / 6, FlxG.width, "Bullet Purgatory", 36);
		title.alignment = "center";
		add(title);
		
		newGame = new FlxText(100, 300, 200, "New Game", 30);
		add(newGame);
		options = new FlxText(100, 350, 200, "Options", 30);
		add(options);
		exit = new FlxText(100, 420, 200, "Exit", 30);
		add(exit);
		
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
		
		if(FlxG.keyboard.anyJustPressed(["UP", "W"]) || Reg.controller.justUpPressed()) {
			FlxG.sound.play("assets/sounds/select.wav", Reg.sfxVolume);
			selection--;
			
			if(selection == -1)
				selection = 2;
		}
		if(FlxG.keyboard.anyJustPressed(["DOWN", "S"]) || Reg.controller.justDownPressed()) {
			FlxG.sound.play("assets/sounds/select.wav", Reg.sfxVolume);
			selection++;
			
			if(selection == 3)
				selection = 0;
		}
		
		if(FlxG.keyboard.anyJustPressed(["SPACE", "ENTER"]) || Reg.controller.anyJustPressed([Controller.A, Controller.START])) {
			switch(selection) {
				case 0:
					onNewGame();
				case 1:
					onOptions();
				case 2:
					onExit();
			}
		}
		
		newGame.color = 0xFFFFFFFF;
		options.color = 0xFFFFFFFF;
		exit.color = 0xFFFFFFFF;

		switch(selection) {
			case 0:
				newGame.color = Constants.SELECTED_ITEM_COLOR;
			case 1:
				options.color = Constants.SELECTED_ITEM_COLOR;
			case 2:
				exit.color = Constants.SELECTED_ITEM_COLOR;
		}
		
		Reg.controller.poll();
	}
	
	private function onNewGame():Void
	{
		FlxG.switchState(new PlayState());
	}
	
	private function onOptions():Void
	{
		FlxG.switchState(new OptionsState());
	}
	
	private function onExit():Void
	{
		System.exit(0);
	}
}