package entities;

import utils.*;

import flixel.*;
import flixel.util.*;
import flixel.group.*;

class Space extends FlxGroup
{
	private var stars:FlxGroup;
	private var planets:FlxGroup;
	
	public function new()
	{
		super(2);
		
		planets = new FlxGroup(Constants.PLANETS_NUM);
		for(i in 0 ... Constants.PLANETS_NUM)
			planets.add(new Planet());
		add(planets);

		stars = new FlxGroup(Constants.STARS_NUM);
		for(i in 0 ... Constants.STARS_NUM)
			stars.add(new Star());
		add(stars);
	}

	override public function update()
	{
		var temp:Int = FlxRandom.intRanged(0, 5);
		if(temp == 5)
			cast(stars.recycle(), Star).init();

		temp = FlxRandom.intRanged(0, 3000);
		if(temp == 3000)
			cast(planets.recycle(), Planet).init();

		super.update();
	}
}