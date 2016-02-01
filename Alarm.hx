class Alarm extends Hour {
	public var message:String;

	public override function new(?h:Int = 0, ?m:Int = 0, ?s:Int = 0, ?message:String):Void {
		super();
		populate();
		this.message = message;

		hours.setIndex(h);
		minutes.setIndex(m);
		seconds.setIndex(s);
	}

	public function isTriggered():Bool {
		if ( getTime() == now() ) return true;
		return false;
	}
}