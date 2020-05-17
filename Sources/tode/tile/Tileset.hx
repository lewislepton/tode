// tode
// Lewis Lepton
// https://lewislepton.com

package tode.tile;

import kha.Color;
import kha.Canvas;
import kha.Image;

import tode.group.Pool;
import tode.tile.Tile;

class Tileset extends Pool<Tile> {
	private var _tileSheet:Image;
	private var _tileWidth:Int;
	private var _tileHeight:Int;
	private var _tileColumns:Int;
	private var _tileRows:Int;

	public function new(tileWidth:Int, tileHeight:Int, tileSheet:Image):Void {
		super();
		this._tileWidth = tileWidth;
		this._tileHeight = tileHeight;
		this._tileSheet = tileSheet;
		this._tileColumns = Std.int(tileSheet.width / tileWidth);
		this._tileRows = Std.int(tileSheet.height / tileHeight);
	}

	override public function render(canvas:Canvas):Void {
		canvas.g2.color = Color.White;
		for (m in this.entity) {
			var sy = Std.int(m.index / _tileColumns);
			var sx = Std.int(m.index - sy * _tileColumns);
			canvas.g2.drawSubImage(_tileSheet, m.x, m.y, sx * m.width, sy * m.height, m.width, m.height);
		}
	}
}
