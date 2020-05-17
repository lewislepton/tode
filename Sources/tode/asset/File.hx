// tode
// Lewis Lepton
// https://lewislepton.com

package tode.asset;

class File {
	public static inline function image(name:String):kha.Image {
		return Reflect.field(kha.Assets.images, name);	
	}

	public static inline function file(name:String):kha.Blob {
		return Reflect.field(kha.Assets.blobs, name);	
	}
	
	public static inline function sound(name:String):kha.Sound {
		return Reflect.field(kha.Assets.sounds, name);	
	}
	
	public static inline function font(name:String):kha.Font {
		return Reflect.field(kha.Assets.fonts, name);	
	}
	
	public static inline function video(name:String):kha.Video {
		return Reflect.field(kha.Assets.videos, name);	
	}
}