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
	
	private var cursor:FlxSprite;
	
	private var selection:Int = 0;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		// Set a background color
		FlxG.cameras.bgColor = 0xff131c1b;
		
		title = new FlxText(10, 50, 400, "Options", 36);
		add(title);
		
		sfxVol = new FlxText(100, 300, 300, "SFX Vol:    " + Reg.sfxVolume * 100 + "%", 30);
		add(sfxVol);
		musicVol = new FlxText(100, 350, 300, "Music Vol: " + Reg.musicVolume * 100 + "%", 30);
		add(musicVol);
		back = new FlxText(100, 420, 200, "Back", 30);
		add(back);
		
		cursor = new FlxSprite(50, 290, "assets/images/ship.png");
		add(cursor);
		
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
		
		if(FlxG.keyboard.anyJustPressed(["LEFT", "A"])) {
			switch(selection) {
				case 0:
					if(Reg.sfxVolume > 0.1) {
						Reg.sfxVolume -= 0.1;
						FlxG.sound.play("assets/sounds/select.wav", Reg.sfxVolume);
					}
					/*else if(Reg.sfxVolume == 0.1) {
						Reg.sfxVolume = 0;
						FlxG.sound.play("assets/sounds/select.wav", Reg.sfxVolume);
					}*/
				case 1:
					if(Reg.musicVolume > 0)
						Reg.musicVolume -= 0.1;
			}
		}
		
		if(FlxG.keyboard.anyJustPressed(["RIGHT", "D"])) {
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
		
		if(FlxG.keyboard.anyJustPressed(["UP", "W"])) {
			FlxG.sound.play("assets/sounds/select.wav", Reg.sfxVolume);
			selection--;
			
			if(selection == -1)
				selection = 2;
		}
		if(FlxG.keyboard.anyJustPressed(["DOWN", "S"])) {
			FlxG.sound.play("assets/sounds/select.wav", Reg.sfxVolume);
			selection++;
			
			if(selection == 3)
				selection = 0;
		}
		
		if(FlxG.keyboard.anyJustPressed(["SPACE", "ENTER"])) {
			switch(selection) {
				case 2:
					onBack();
			}
		}
		
		switch(selection) {
			case 0:
				cursor.y = 290;
			case 1:
				cursor.y = 340;
			case 2:
				cursor.y = 410;
		}
		
		sfxVol.text = "SFX Vol:    " + Std.int(Reg.sfxVolume * 100) + "%";
		musicVol.text = "Music Vol: " + Std.int(Reg.musicVolume * 100) + "%";
	}
	
	private function onBack():Void
	{
		FlxG.switchState(new MenuState());
	}
}