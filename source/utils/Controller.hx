package utils;

import flixel.*;
import flixel.system.input.gamepad.*;

class Controller 
{
	#if mac
	inline static public var A:Int = 11;
	inline static public var B:Int = 12;
	inline static public var X:Int = 13;
	inline static public var Y:Int = 14;
	inline static public var LB:Int = 8;
	inline static public var RB:Int = 9;
	inline static public var BACK:Int = 5;
	inline static public var START:Int = 4;
	inline static public var LEFT_ANALOGUE:Int = 6;
	inline static public var RIGHT_ANALOGUE:Int = 7;
	inline static public var LEFT_ANALOGUE_X:Int = 0;
	inline static public var LEFT_ANALOGUE_Y:Int = 1;
	inline static public var RIGHT_ANALOGUE_X:Int = 2;
	inline static public var RIGHT_ANALOGUE_Y:Int = 3;
	inline static public var DPAD_UP:Int = 0;
	inline static public var DPAD_DOWN:Int = 1;
	inline static public var DPAD_LEFT:Int = 2;
	inline static public var DPAD_RIGHT:Int = 3;
	inline static public var TRIGGER:Int = 3;
	#else
	
	inline static public var A:Int = 0;
	inline static public var B:Int = 1;
	inline static public var X:Int = 2;
	inline static public var Y:Int = 3;
	inline static public var LB:Int = 4;
	inline static public var RB:Int = 5;
	inline static public var BACK:Int = 6;
	inline static public var START:Int = 7;
	inline static public var LEFT_ANALOGUE:Int = 8;
	inline static public var RIGHT_ANALOGUE:Int = 9;
	inline static public var LEFT_ANALOGUE_X:Int = 0;
	inline static public var LEFT_ANALOGUE_Y:Int = 1;
	inline static public var RIGHT_ANALOGUE_X:Int = 4;
	inline static public var RIGHT_ANALOGUE_Y:Int = 3;
	inline static public var TRIGGER:Int = 2;
	#end

	private var gamePad:FlxGamepad;
	
	private var lastUp:Bool = false;
	private var lastDown:Bool = false;
	private var lastRight:Bool = false;
	private var lastLeft:Bool = false;
	
	public function new()
	{
		gamePad = FlxG.gamepads.get(0);
	}

	public function isButtonPressed(buttonId:Int):Bool
	{
		return gamePad.pressed(buttonId);
	}
	
	public function justButtonPressed(buttonId:Int):Bool
	{
		return gamePad.justPressed(buttonId);
	}

	public function isDownPressed():Bool
	{
		if(gamePad.hat.y > 0 || gamePad.getAxis(LEFT_ANALOGUE_Y) > gamePad.deadZone)
			return true;

		return false;
	}
	
	public function justDownPressed():Bool
	{
		if(isDownPressed() && !lastDown)
			return true;
			
		return false;
	}

	public function isLeftPressed():Bool
	{
		if(gamePad.hat.x < 0 || gamePad.getAxis(LEFT_ANALOGUE_X) < -gamePad.deadZone)
			return true;

		return false;
	}
	
	public function justLeftPressed():Bool
	{
		if(isLeftPressed() && !lastLeft)
			return true;
			
		return false;
	}

	public function isRightPressed():Bool
	{
		if(gamePad.hat.x > 0 || gamePad.getAxis(LEFT_ANALOGUE_X) > gamePad.deadZone)
			return true;

		return false;
	}
	
	public function justRightPressed():Bool
	{
		if(isRightPressed() && !lastRight)
			return true;
			
		return false;
	}

	public function isUpPressed():Bool
	{
		if(gamePad.hat.y < 0 || gamePad.getAxis(LEFT_ANALOGUE_Y) < -gamePad.deadZone)
			return true;

		return false;
	}
	
	public function justUpPressed():Bool
	{
		if(isUpPressed() && !lastUp)
			return true;
			
		return false;
	}
	
	public function poll():Void
	{
		lastDown = isDownPressed();
		lastLeft = isLeftPressed();
		lastRight = isRightPressed();
		lastUp = isUpPressed();
	}
}