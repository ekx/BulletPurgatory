package utils;

class Reg
{
	static public var hud:HUD;

	static public var score(get, set):Int;
	static private var _score:Int = 0;
	static public function get_score():Int {return _score;}
	static public function set_score(value:Int):Int {_score = value; hud.updateHUD(); return _score;}

	static public var lives(get, set):Int;
	static private var _lives:Int = 3;
	static public function get_lives():Int {return _lives;}
	static public function set_lives(value:Int):Int {_lives = value; hud.updateHUD(); return _lives;}
	
	static public var upgrades:Int = 0;
	
	static public var sfxVolume:Float = 1;
	static public var musicVolume:Float = 1;
}