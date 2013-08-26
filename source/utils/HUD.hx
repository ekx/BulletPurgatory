
package utils;

import flixel.*;
import flixel.group.*;
import flixel.text.*;

class HUD extends FlxGroup
{
	private var livesCounter:FlxGroup;
	private var scoreCounter:FlxText;

	public function new()
	{
		super();

		updateHUD();
	}

	public function updateHUD():Void
	{
		clear();

		livesCounter = new FlxGroup(6);
		add(livesCounter);

		var temp:FlxSprite;
		for(i in 0 ... Reg.lives) {
			temp = new FlxSprite(32 * i, 0, "assets/images/ship.png");
			livesCounter.add(temp);
		}

		scoreCounter = new FlxText(300, 0, 100, "SCORE: " + leadingZeros(Reg.score), 20);
		add(scoreCounter);
	}

	private function leadingZeros(num:Int):String
	{
	    if(num < 10) {
	       return "00000" + num;
	    }
	    else if(num < 100) {
	       return "0000" + num;
	    }
	    else if(num < 1000) {
	       return "000" + num;
	    }
	    else if(num < 10000) {
	       return "00" + num;
	    }
	    else if(num < 100000) {
	       return "0" + num;
	    }

	    return "" + num;
	}
}