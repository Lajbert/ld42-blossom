import mt.deepnight.Lib;
import mt.MLib;

class Viewport extends mt.Process {
	var game(get,never) : Game; inline function get_game() return Game.ME;
	var level(get,never) : Level; inline function get_level() return Game.ME.level;

	public var x = 0.;
	public var y = 0.;
	public var dx = 0.;
	public var dy = 0.;
	public var wid(get,never) : Int;
	public var hei(get,never) : Int;
	public var screenWid(get,never) : Int;
	public var screenHei(get,never) : Int;

	public function new() {
		super(Game.ME);
	}

	inline function get_screenWid() return Boot.ME.s2d.width;
	inline function get_screenHei() return Boot.ME.s2d.height;

	inline function get_wid() {
		return MLib.ceil( Boot.ME.s2d.width / Const.SCALE );
	}

	inline function get_hei() {
		return MLib.ceil( Boot.ME.s2d.height / Const.SCALE );
	}

	public function repos() {
		x = game.treeRoot.centerX;
		y = game.treeRoot.centerY;
	}

	override public function update() {
		super.update();

		// Balance between hero & mobs
		//var tx = game.treeRoot.centerX;
		//var ty = game.treeRoot.centerY-Const.GRID*3;
		//var n = 1.0;
		//var w = 1;
		//tx/=n;
		//ty/=n;
		//var a = Math.atan2(ty-y, tx-x);
		//var d = mt.deepnight.Lib.distance(x, y, tx, ty);
		//if( d>=10 ) {
			//var s = 0.5 * MLib.fclamp(d/100,0,1);
			////var s = 0.03 + 0.8 * MLib.fclamp(d/100,0,1);
			//dx+=Math.cos(a)*s;
			//dy+=Math.sin(a)*s;
		//}

		//game.fx.markerFree(tx,ty,0xFFFF00, true);
		//game.fx.markerFree(x,y,0xFF00FF, true);

		//if( !game.mouseScroll.active ) {
			x+=dx;
			y+=dy;
			dx*=0.7;
			dy*=0.7;
			//dx*=0.97;
			//dy*=0.97;
			//if( Lib.distance(x,y,tx,ty)<=20 ) {
				//dx*=0.8;
				//dy*=0.8;
			//}
		//}
		//x = MLib.fclamp(x,-screenWid,0);
		game.scroller.x = Std.int( -x + wid*0.5 );
		game.scroller.y = Std.int( -y + hei*0.5 );
		//var prioCenter = 0;
		//game.scroller.x = Std.int( -(x+prioCenter*level.wid*0.5*Const.GRID)/(1+prioCenter) + wid*0.5 );
		//game.scroller.y = Std.int( -(y+prioCenter*level.hei*0.5*Const.GRID)/(1+prioCenter) + hei*0.5 );
		//game.scroller.x = MLib.fclamp(game.scroller.x, -level.wid*Const.GRID+wid-15, 15);
		//game.scroller.y = MLib.fclamp(game.scroller.y, -level.hei*Const.GRID+hei-15, 15);
	}
}