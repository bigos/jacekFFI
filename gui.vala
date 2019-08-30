// gui vala

public class Gui : Gtk.Application {
	public Gui () {
		Object (
			application_id : "1234567",
			flags : ApplicationFlags.FLAGS_NONE
			);
	}
	
	protected override void activate () {
		var main_window = new Gtk.ApplicationWindow (this);		
		main_window.default_height = 300;
		main_window.default_width = 300;
		main_window.title = "Hello World";

		Gtk.Label label = new Gtk.Label ("Hello GTK");
		main_window.add (label);
		main_window.show_all ();
	}
	
	public static int main (string[] args) {
		var app = new Gui ();
		return app.run (args);
	}
	
}
