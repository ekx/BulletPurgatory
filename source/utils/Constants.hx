package utils;

class Constants
{	
	//Reg
	public static inline var NUM_BOMBS:Int = 3;
	public static inline var NUM_LIVES:Int = 3;
	
	//Enemy
	public static inline var ENEMY_HIT_TIMEOUT:Int = 9;
	public static inline var ENEMY_BULLET_SIZE:Int = 7;
	
	//SimpleEnemy
	public static inline var SIMPLE_ENEMY_SHOOT_TIMER:Int = 50;
	
	//Pickups
	public static inline var PICKUP_SPEED:Int = 40;
	
	//PlayerShip
	public static inline var PLAYER_HORIZONTAL_SPEED:Int = 300;
	public static inline var PLAYER_VERTICAL_SPEED:Int = 200;
	public static inline var PLAYER_SHOT_TIMEOUT:Int = 10;
	public static inline var PLAYER_BOMB_TIMEOUT:Int = 130;
	public static inline var PLAYER_HIT_TIMEOUT:Int = 200;
	public static inline var SCREEN_BOUNDARY_PADDING:Int = 4;
	
	//Space
	public static inline var STARS_SPEED:Int = 200; 
	public static inline var STARS_NUM:Int = 50;
	public static inline var PLANETS_SPEED:Int = 20; 
	public static inline var PLANETS_NUM:Int = 5;
	
	//Ground
	public static inline var TILE_SIZE:Int = 16;
	public static inline var GROUND_SPEED:Int = 200;
	
	//Recycler
	public static inline var NUM_PLAYER_BULLETS:Int = 150;
	public static inline var NUM_ENEMY_BULLETS:Int = 400;
	public static inline var NUM_EXPLOSIONS:Int = 50;
	
	public static inline var NUM_EXTRA_LIVES:Int = 10;
	public static inline var NUM_EXTRA_BOMBS:Int = 10;
	public static inline var NUM_UPGRADES:Int = 10;
	
	//Announcer
	public static inline var ANNONCER_BG_COLOR:Int = 0xCCFFFFFF;
	public static inline var ANNONCER_TEXT_COLOR:Int = 0xFF000000;
	public static inline var ANNONCER_FONT_SIZE:Int = 40;
	public static inline var ANNONCER_Y_POS:Int = 100;
	public static inline var ANNONCER_HEIGHT:Int = 100;

	//Menu
	public static inline var SELECTED_ITEM_COLOR:Int = 0xFF5CB85C;

	//General
	public static inline var FONT:String = "assets/data/pixel.ttf";
}