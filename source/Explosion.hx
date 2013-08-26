package ;

import flixel.*;
import flixel.group.*;
import flixel.effects.particles.*;

class Explosion extends FlxGroup
{
	private static var LIFE_TIME:Int = 1000;
	private var lifeTime:Int = 0;

	private var debris:FlxEmitter;
	private var explosion:FlxSprite;

	public function new(parent:FlxObject)
	{
		super();

		debris = new FlxEmitter();
			
		debris.at(parent);
		debris.makeParticles("assets/images/debris.png", 5, 16, false, 0, false);
		debris.start(true, 3, 0.1, 5, 1);

		add(debris);

		explosion = new FlxSprite(parent.x, parent.y);

		explosion.loadGraphic("assets/images/explosion.png", true);
		explosion.x -= explosion.width / 1.5;
		explosion.y -= explosion.height / 3;
		explosion.addAnimation("explosion", [0, 1, 2, 3, 4, 5, 6, 7], 24, false);
		explosion.play("explosion");

		add(explosion);

		FlxG.sound.play("assets/sounds/explosion.wav");
	}

	override public function update():Void
	{
		lifeTime++;

		super.update();

		if(explosion.exists && explosion.finished)
			explosion.kill();

		if(debris.exists && lifeTime > LIFE_TIME)
			debris.kill();

		if(!debris.exists && !explosion.exists)
			kill();
	}
}