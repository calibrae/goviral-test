/**
 * Created by IntelliJ IDEA.
 * User: cali
 * Bitbucket: https://bitbucket.org/calibrae
 * Date: 11/09/15
 * Time: 11:55
 */
package {
	import com.milkmangames.nativeextensions.GVSocialServiceType;
	import com.milkmangames.nativeextensions.GoViral;

	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;

	public class Game extends Sprite {
		public function Game() {
		}

		public function run() : void {

			var quad : Quad = new Quad(200, 200, 0xFF0000);
			quad.addEventListener(TouchEvent.TOUCH, _touch);

			addChild(quad);

			_text.x = quad.width;
			_text.border = true;
			_text.color = 0xFF0000;
			addChild(_text);
		}

		private function _log(msg : String) : void {
			_text.text += msg + "\r";
			trace(msg);
		}

		private function _touch(event : TouchEvent) : void {
			var touch : Touch = event.getTouch(this, TouchPhase.ENDED);
			if (touch) {
				_log("_displayShare");
				if (GoViral.goViral.isSocialServiceAvailable(GVSocialServiceType.FACEBOOK)) {
					_log("facebook available");
					GoViral.goViral.displaySocialComposerView(GVSocialServiceType.FACEBOOK, "Try James !! ", null, "http://www.chaudron-magique.com");
				}
				else {
					_log("social service unavailable");
				}

			}
		}


		private var _text : TextField = new TextField(300, 100, "");


	}
}

