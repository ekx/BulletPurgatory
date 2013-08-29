package entities;

import utils.*;

import flixel.*;
import flixel.text.*;
import flixel.group.*;

class Announcer extends FlxGroup
{
	private var background:FlxSprite;
	private var text:FlxText;

	private var startText:Bool = false;

	public function new(content:String)
	{
		super();

		background = new FlxSprite(0, -Constants.ANNONCER_HEIGHT);
		add(background);

		background.makeGraphic(FlxG.width, Constants.ANNONCER_HEIGHT, Constants.ANNONCER_BG_COLOR);
		background.velocity.y = 700;

		text = new FlxText(-FlxG.width, Constants.ANNONCER_Y_POS + (Constants.ANNONCER_HEIGHT / 2 - Constants.ANNONCER_FONT_SIZE / 2), FlxG.width, content, Constants.ANNONCER_FONT_SIZE);
		add(text);

		text.alignment = "center";
		text.moves = true;
		text.color = Constants.ANNONCER_TEXT_COLOR;
	}

	override public function update():Void
	{
		super.update();

		//Move background down
		if(background.y < Constants.ANNONCER_Y_POS && background.y > Constants.ANNONCER_Y_POS - 60 && background.velocity.y > 20)
			background.velocity.y -= background.velocity.y / 5;

		//Stop background and start text movement
		else if(background.y >= Constants.ANNONCER_Y_POS && !startText) {
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
		else if(text.x >= FlxG.width && background.y > -Constants.ANNONCER_HEIGHT)
			background.velocity.y += background.velocity.y / 5;

		//Everything left the screen -> delete to free memory
		else if(text.x >= FlxG.width && background.y <= -Constants.ANNONCER_HEIGHT) {
			background.velocity.y = 0;

			text.kill;
			background.kill;

			kill();
		}
	}
}