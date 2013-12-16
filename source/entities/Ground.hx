package entities;

import utils.*;

import flixel.*;
import flixel.group.*;
import flixel.tile.*;
import flixel.util.*;

class Ground extends FlxGroup
{
	private var type:String;
	
	private var mapA:FlxTilemap;
	private var mapB:FlxTilemap;
	
	public function new(type:String)
	{
		super();
		
		this.type = type;
		
		mapA = new FlxTilemap();
		mapA.loadMap(FlxTilemap.arrayToCSV(generateMap(), Std.int(FlxG.width / Constants.TILE_SIZE)) , "assets/images/" + type + ".png", Constants.TILE_SIZE, Constants.TILE_SIZE, FlxTilemap.OFF);
		mapA.y = -FlxG.height;
		mapA.velocity.y = Constants.GROUND_SPEED;
		mapA.moves = true;
		add(mapA);

		mapB = new FlxTilemap();
		mapB.loadMap(FlxTilemap.arrayToCSV(generateMap(), Std.int(FlxG.width / Constants.TILE_SIZE)) , "assets/images/" + type + ".png", Constants.TILE_SIZE, Constants.TILE_SIZE, FlxTilemap.OFF);
		mapB.y = -(FlxG.height * 3);
		mapB.velocity.y = Constants.GROUND_SPEED;
		mapB.moves = true;
		add(mapB);		
	}
	
	private function generateMap():Array<Int> {
		var map:Array<Int> = new Array<Int>();
		
		for(i in 0 ... Std.int((FlxG.height * 2) / Constants.TILE_SIZE * FlxG.width / Constants.TILE_SIZE)) {
			map[i] = 0;
		}
		
		return map;
	}
	
	override public function update():Void
	{
		super.update();
		
		if (mapA.y >= FlxG.height) {
			mapA.loadMap(FlxTilemap.arrayToCSV(generateMap(), Std.int(FlxG.width / Constants.TILE_SIZE)) , "assets/images/" + type + ".png", Constants.TILE_SIZE, Constants.TILE_SIZE, FlxTilemap.OFF);
			mapA.y = -(FlxG.height * 3);
		}
		
		if (mapB.y >= FlxG.height) {
			mapB.loadMap(FlxTilemap.arrayToCSV(generateMap(), Std.int(FlxG.width / Constants.TILE_SIZE)) , "assets/images/" + type + ".png", Constants.TILE_SIZE, Constants.TILE_SIZE, FlxTilemap.OFF);
			mapB.y = -(FlxG.height * 3);
		}
	}
}