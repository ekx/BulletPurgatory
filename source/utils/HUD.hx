
package utils;

import flixel.*;
import flixel.group.*;
import flixel.text.*;

class HUD extends FlxGroup
{
	private var livesCounter:FlxGroup;
	private var bombsCounter:FlxGroup;
	private var scoreCounter:FlxText;

	public function new()
	{
		super();

		updateHUD();
	}

	public function updateHUD():Void
	{
		clear();

		var temp:FlxSprite;
		
		livesCounter = new FlxGroup(3);
		add(livesCounter);
		
		if(Reg.lives <= 3) {
			for(i in 0 ... Reg.lives) {
				temp = new FlxSprite(32 * i, 0, "assets/images/ship.png");
				livesCounter.add(temp);
			}
		}
		else {
			var temp2:FlxText = new FlxText(0, 15, 40, Reg.lives + "X", 20);
			livesCounter.add(temp2);

			temp = new FlxSprite(35, 0, "assets/images/ship.png");
			livesCounter.add(temp);
		}
		
		bombsCounter = new FlxGroup(3);
		add(bombsCounter);
		
		if(Reg.bombs <= 3) {
			for(i in 0 ... Reg.bombs) {
				temp = new FlxSprite(32 * i, FlxG.height - 32, "assets/images/bomb-pickup.png");
				bombsCounter.add(temp);
			}
		}
		else {
			var temp2:FlxText = new FlxText(0, FlxG.height - 30, 40, Reg.bombs + "X", 20);
			bombsCounter.add(temp2);

			temp = new FlxSprite(35, FlxG.height - 32, "assets/images/bomb-pickup.png");
			bombsCounter.add(temp);
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