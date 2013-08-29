package utils;

class Reg
{
	static public var controller:Controller = new Controller();

	static public var hud:HUD;

	static public var score(get, set):Int;
	static private var _score:Int;
	static public function get_score():Int {return _score;}
	static public function set_score(value:Int):Int {_score = value; hud.updateHUD(); return _score;}

	static public var lives(get, set):Int;
	static private var _lives:Int;
	static public function get_lives():Int {return _lives;}
	static public function set_lives(value:Int):Int { _lives = value; hud.updateHUD(); return _lives; }
	
	static public var bombs(get, set):Int;
	static private var _bombs:Int;
	static public function get_bombs():Int {return _bombs;}
	static public function set_bombs(value:Int):Int { _bombs = value; hud.updateHUD(); return _bombs; }
	
	static public var upgrades:Int;
	
	static public var sfxVolume:Float = 1;
	static public var musicVolume:Float = 1;
}