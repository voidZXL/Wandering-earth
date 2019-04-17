package
{
	import flash.display.MovieClip;
	import flash.events.*
		import flash.ui.Keyboard;


	public class ship extends MovieClip
	{
		var v: Number = 0
		var w: Number = 0
		
		var fv: Number = 1
		var fw: Number = 1
		var a: Number = 0
		var aw: Number = 0
		var control:Boolean=true
		var maxv: Number = 2
		
		const R:Number=180/3.1416;
			//public var eng: Number = 80
		public var keydown: Boolean
		
		public var fire:Array=new Array();
		public function ship()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function onAddedToStage(event: Event): void
		{
			//trace(Math.atan2(1,1)/R)
			//ship.scale*=2
			//f1.gotoAndStop(2);
			//f2.gotoAndStop(2);
			pb.visible = false
			db.visible = false
			
			stage.addEventListener(Event.ENTER_FRAME, ef);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyp);

			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		private function onRemovedFromStage(event: Event): void
		{
			stage.removeEventListener(Event.ENTER_FRAME, ef);
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyp);
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		private function onKeyDown(event: KeyboardEvent): void
		{
			keydown=true

			if (event.keyCode == Keyboard.A)
			{
				if (f2.currentFrame == 2)
				{
					f2.play();
				}
					fv = 1
					a = -0.01
			}
			if (event.keyCode == Keyboard.D)
			{
				if (f1.currentFrame == 2)
				{
					f1.play();
				}
					fv = 1
					a = 0.02

			}
			if (event.keyCode == Keyboard.S)
			{
				fw = 1
				aw = 0.005
				db.visible = true;
			}
			if (event.keyCode == Keyboard.W)
			{
				fw = 1
				aw = -0.005
				pb.visible = true;
			}
			if (event.keyCode == Keyboard.SPACE)
			{}
		}
		private function onKeyp(event: KeyboardEvent): void
		{
            keydown=false
			if (event.keyCode == Keyboard.A)
			{
				a = 0
				fv = 0.98
				f2.gotoAndPlay("out");
			}
			if (event.keyCode == Keyboard.D)
			{
				a = 0
				fv = 0.98
				f1.gotoAndPlay("out");
			}
			if (event.keyCode == Keyboard.S || event.keyCode == Keyboard.W)
			{
				aw=0;
				fw = 0.98
				pb.visible = false
			    db.visible = false
			}
		}
		/*
		private function onKeyDown2(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.LEFT)
			 {
				 fx=1
				 ax=-2 *eng/100
				 er.gotoAndStop(2)
				 if(eng!=100)
				 {
				 eng-=0.2
				 }
			 }
			if (event.keyCode == Keyboard.RIGHT)
			 {
				 fx=1
				 ax=3 *eng/100
				  el.gotoAndStop(2)
				  if(eng!=100)
				 {
				 eng-=0.5
				 }
			 }
			 if (event.keyCode == Keyboard.DOWN)
			 {
				 fy=1
				vy=6 *eng/100
				  ep.gotoAndStop(2)
				  if(eng!=100)
				 {
				 eng-=0.2
				 }
			 }
			if (event.keyCode == Keyboard.UP)
			 {
				 fy=1
				 vy=-6 *eng/100
				  ed.gotoAndStop(2)
				  if(eng!=100)
				 {
				 eng-=0.2
				 }

			 }
			 if (event.keyCode == 96)
			 {
				 if(canjs)
				 {
					 canjs=false
					 eng=200
					 js=true
				 }
			 }
		 }
		 private function onKeyp2(event:KeyboardEvent):void
		{
			
			if (event.keyCode == Keyboard.LEFT)
			 {
				 ax=0
				fx=0.95
				  er.gotoAndStop(1)
			 }
			if (event.keyCode == Keyboard.RIGHT)
			 {
				 ax=0
                fx=0.95
				 el.gotoAndStop(1)
			 }
              if (event.keyCode == Keyboard.DOWN||event.keyCode == Keyboard.UP)
			 {
				 fy=0.95
				 ed.gotoAndStop(1)
				 ep.gotoAndStop(1)
			 }
		 }*/
		private function ef(event: Event): void
		{
			if(control)
			{
				MovieClip(parent).home.control(x,y);
			}
			
			x += v*Math.cos(rotation/R)//*scaleX
			y += v*Math.sin(rotation/R)//*scaleX
			
			v += a//*scaleX
			rotation += w
			w+=aw;
			
			v*=fv
			w*=fw
			
			if(v>maxv)
			{
				v=maxv
			}
			if(v<-maxv)
			{
				v=-maxv
			}
		}
	}
}