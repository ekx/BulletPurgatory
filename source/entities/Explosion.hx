package entities;

import flixel.*;

class Explosion extends FlxSprite
{
	public function new()
	{
		super(-100, -100);

		loadGraphic("assets/images/explosion.png", true);
		x -= width / 1.5;
		y -= height / 3;
		addAnimation("explosion", [0, 1, 2, 3, 4, 5, 6, 7], 24, false);
		
		exists = false;
	}

	override public function reset(locX:Float, locY:Float):Void {
		super.reset(locX - width / 1.5 - 10, locY - height / 2);

		play("explosion");
		FlxG.sound.play("assets/sounds/explosion.wav");
	}

	override public function update():Void
	{
		super.update();

		if(exists && finished)
			kill();
	}
}