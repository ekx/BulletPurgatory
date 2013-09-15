package utils;

import entities.*;
import flixel.group.*;

class Reg
{
	static public var controller:Controller = new Controller();

	static public var player:PlayerShip;
	static public var bomb:Bomb;
	static public var enemies:FlxGroup;
	
	static public var starField:StarField;
	static public var hud:HUD;

	static public var score(get, set):Int;
	static private var _score:Int;
	static public function get_score():Int {return _score;}
	static public function set_score(value:Int):Int {_score = value; hud.updateHUD(); return _score;}

	static public var lives(get, set):Int;
	static private var _lives:Int;
	static public function get_lives():Int {return _lives;}
	static public function set_lives(value:Int):Int {_lives = value; if(_lives > 9) _lives = 9; hud.updateHUD(); return _lives;}
	
	static public var bombs(get, set):Int;
	static private var _bombs:Int;
	static public function get_bombs():Int {return _bombs;}
	static public function set_bombs(value:Int):Int {_bombs = value; if(_bombs > 9) _bombs = 9; hud.updateHUD(); return _bombs;}
	
	static public var upgrades(get, set):Int;
	static private var _upgrades:Int;
	static public function get_upgrades():Int {return _upgrades;}
	static public function set_upgrades(value:Int):Int {_upgrades = value; if(_upgrades > 5) _upgrades = 5; return _upgrades;}
	
	static public var sfxVolume:Float = 1;
	static public var musicVolume:Float = 1;
}