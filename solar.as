package
{
	import flash.display.*
	import flash.events.*
		import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.text.TextField
	import flash.media.Sound
	import flash.media.SoundChannel
	import fl.transitions.Tween;
	import fl.transitions.easing.*
		import fl.transitions.TweenEvent;
	import flash.utils.Timer;

	public class solar extends MovieClip
	{
		var ting: Boolean = false;
		var oldw: Number = width;
		var oldh: Number = height;
		var ns: Number = 1
		var blx, bly: Number
		var stars: Array = new Array();
		public function solar()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function onAddedToStage(event: Event): void
		{
			for (var i: int = 0; i < 100; i++)
			{
				var st: star = new star()
				addChild(st)
				//stars.push(MovieClip(st));

				setChildIndex(st, 0)
				st.x = -1000 + 2000 * Math.random()
				st.y = 1400 * Math.random() - 400
				st.scaleX = Math.random() / 2 + 0.1
				st.scaleY = Math.random() / 2 + 0.1
			}
			stage.addEventListener(Event.ENTER_FRAME, ef);
			stage.addEventListener(MouseEvent.MOUSE_WHEEL, scale_change)
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		private function onRemovedFromStage(event: Event): void
		{
			stage.removeEventListener(Event.ENTER_FRAME, ef);
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		public function lineFromTo(fx:Number,fy:Number,sx: Number, sy: Number)
		{
			var sp1: Sprite = new Sprite();
			addChild(sp1);
			var graphics: Graphics = sp1.graphics;
			trace(sp1)
			graphics.moveTo(fx, fy);
			graphics.lineTo(sx, sy);
		}
		function scale_change(e: MouseEvent): void
		{
			ns = scaleX + (e.delta > 0 ? 0.003 : -0.003);
			if (ns > 0.3 && ns < 4)
			{
				/*
				if (ns > scaleX)
				{
					for (var i: int = 0; i < 100; i++)
					{
						if (!stars[i].visible)
						{
							stars[i].cross();
						}
					}
				}*/
				
				oldw = width;
				oldh = height;
				blx = (mouseX - x) / oldw;
				bly = (mouseY - y) / oldh;
				scaleX = scaleY = ns;
				x -= (width - oldw) * blx;
				y -= (height - oldh) * bly;
			}

		}
		private function ef(event: Event): void
		{
			var mp: Point = new Point(sp.x, sp.y)
		    var mx = localToGlobal(mp).x
		    var my = localToGlobal(mp).y
             if((mx>750||my>550||my<50)&&scaleX>0.4)
			 {
				 //scaleX = scaleY = ns;
				 var tx:Tween=new Tween(this,"x",Regular.easeOut,x, 400-0.8*(400-x),100,false)
				 var ty:Tween=new Tween(this,"y",Regular.easeOut,y, 300-0.8*(300-y),100,false)
				 //var ty:Tween=new Tween(this,"y",Regular.easeOut,y, (0.8 * height - oldh) * bly,100,false)
				 var tsx:Tween=new Tween(this,"scaleX",Regular.easeOut,scaleX,0.8 * scaleX,50,false)
				 var tsy:Tween=new Tween(this,"scaleY",Regular.easeOut,scaleY,0.8 * scaleY,50,false)
			 }
			 if(mx<500&&my<400&&my>200)
			 {
				 var tx:Tween=new Tween(this,"x",Regular.easeOut,x, 400-1.1*(400-x),100,false)
				 var ty:Tween=new Tween(this,"y",Regular.easeOut,y, 300-1.1*(300-y),100,false)
				 //var ty:Tween=new Tween(this,"y",Regular.easeOut,y, (0.8 * height - oldh) * bly,100,false)
				 var tsx:Tween=new Tween(this,"scaleX",Regular.easeOut,scaleX,scaleX*1.1,50,false)
				 var tsy:Tween=new Tween(this,"scaleY",Regular.easeOut,scaleY,scaleY*1.1,50,false)
			 }
			//trace(mx)
		}


	}
}