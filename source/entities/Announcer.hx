package entities;

import flixel.*;
import flixel.text.*;
import flixel.group.*;

class Announcer extends FlxGroup
{
	private static var BG_COLOR:Int = 0xCCFFFFFF;
	private static var TEXT_COLOR:Int = 0xFF000000;
	private static var FONT_SIZE:Int = 40;
	private static var Y_POS:Int = 100;
	private static var HEIGHT:Int = 100;

	private var background:FlxSprite;
	private var text:FlxText;

	private var startText:Bool = false;

	public function new(content:String)
	{
		super();

		background = new FlxSprite(0, -HEIGHT);
		add(background);

		background.makeGraphic(FlxG.width, HEIGHT, BG_COLOR);
		background.velocity.y = 700;

		text = new FlxText(-FlxG.width, Y_POS + (HEIGHT / 2 - FONT_SIZE / 2), FlxG.width, content, FONT_SIZE);
		add(text);

		text.alignment = "center";
		text.moves = true;
		text.color = TEXT_COLOR;
	}

	override public function update():Void
	{
		super.update();

		//Move background down
		if(background.y < Y_POS && background.y > Y_POS - 60 && background.velocity.y > 20)
			background.velocity.y -= background.velocity.y / 5;

		//Stop background and start text movement
		else if(background.y >= Y_POS && !startText) {
			background.velocity.y = 0;

			startText = true;
			text.velocity.x = 700;
		}

		//Move text in
		else if(text.x > -60 && text.x < 10 && text.velocity.x > 20 && startText)
			text.velocity.x -= text.velocity.x / 5;

		//Move text out
		else if(text.x < FlxG.width && text.x > 10 && text.velocity.x < 700 && startText)
			text.velocity.x += text.velocity.x / 5;

		//Restart background movement and stop text movement
		else if(text.x >= FlxG.width && background.velocity.y == 0) {
			text.velocity.x = 0;

			background.velocity.y = -20;
		}

		//Move background up
		else if(text.x >= FlxG.width && background.y > -HEIGHT)
			background.velocity.y += background.velocity.y / 5;

		//Everything left the screen -> delete to free memory
		else if(text.x >= FlxG.width && background.y <= -HEIGHT) {
			background.velocity.y = 0;

			text.kill;
			background.kill;

			kill();
		}
	}
}