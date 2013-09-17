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
class OptionsState extends FlxState
{
	private var title:FlxText;
	
	private var sfxVol:FlxText;
	private var musicVol:FlxText;
	private var back:FlxText;
	
	private var selection:Int = 0;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		// Set a background color
		FlxG.cameras.bgColor = 0xff131c1b;
		
		title = new FlxText(0, FlxG.height / 6, FlxG.width, "Options", 36);
		title.font = Constants.FONT;
		title.alignment = "center";
		add(title);
		
		sfxVol = new FlxText(100, 300, 300, "SFX Vol:   " + Reg.sfxVolume * 100, 30);
		sfxVol.font = Constants.FONT;
		add(sfxVol);
		musicVol = new FlxText(100, 350, 300, "Music Vol: " + Reg.musicVolume * 100, 30);
		musicVol.font = Constants.FONT;
		add(musicVol);
		back = new FlxText(100, 420, 200, "Back", 30);
		back.font = Constants.FONT;
		add(back);
		
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
		
		if(FlxG.keyboard.anyJustPressed(["LEFT", "A"]) || Reg.controller.justLeftPressed()) {
			switch(selection) {
				case 0:
					if(Reg.sfxVolume > 0.1) {
						Reg.sfxVolume -= 0.1;
						FlxG.sound.play("assets/sounds/select.wav", Reg.sfxVolume);
					}
				case 1:
					if(Reg.musicVolume > 0)
						Reg.musicVolume -= 0.1;
			}
		}
		
		if(FlxG.keyboard.anyJustPressed(["RIGHT", "D"]) || Reg.controller.justRightPressed()) {
			switch(selection) {
				case 0:
					if(Reg.sfxVolume < 1) {
						Reg.sfxVolume += 0.1;
						FlxG.sound.play("assets/sounds/select.wav", Reg.sfxVolume);
					}
				case 1:
					if(Reg.musicVolume < 1)
						Reg.musicVolume += 0.1;
			}
		}
		
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
				case 2:
					onBack();
			}
		}
		
		sfxVol.color = 0xFFFFFFFF;
		musicVol.color = 0xFFFFFFFF;
		back.color = 0xFFFFFFFF;

		switch(selection) {
			case 0:
				sfxVol.color = Constants.SELECTED_ITEM_COLOR;
			case 1:
				musicVol.color = Constants.SELECTED_ITEM_COLOR;
			case 2:
				back.color = Constants.SELECTED_ITEM_COLOR;
		}
		
		sfxVol.text = "SFX Vol:   " + Std.int(Reg.sfxVolume * 100);
		musicVol.text = "Music Vol: " + Std.int(Reg.musicVolume * 100);
		
		Reg.controller.poll();
	}
	
	private function onBack():Void
	{
		FlxG.switchState(new MenuState());
	}
}