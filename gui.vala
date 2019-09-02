// gui vala

int zzz () {
	int status = 7;
	return status;
}

[CCode ( cname = "myCallback", has_target = false)]
delegate int MyCallback (int a);

static int myMult (int x, int y, MyCallback fn ) {
	var res = x * x;
	stdout.printf("%d\n", res);

	stdout.printf("Callbacked %d\n", fn (3) );
	return (res * 2);
}

public static int vala_main () {
	var app = new Gui ();
	string[] args2 = {};
	return app.run (args2);
}

public class Gui : Gtk.Application {
	public Gui () {
		Object (
			application_id : "org.jacek.vala1",
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
}
