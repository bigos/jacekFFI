// gui vala

int zzz () {
	int status = 7;
	return status;
}

[CCode (cname = "comResult", has_target = false)]
public delegate string ComResult (string a);
 
public static ComResult afni = null;

public static void set_afni (ComResult fn) {
	stdout.printf("setting pointer \n");
	global::afni = fn;
}

[CCode ( cname = "myCallback", has_target = false)]
delegate int MyCallback (int a);

static int myMult (int x, int y, MyCallback fn ) {
	var res = x * x;
	stdout.printf("%d\n", res);

	stdout.printf("Callbacked %d\n", fn (3) );
	return (res * 2);
}

public static int vala_main (string[] args) {
	var app = new Gui ();	
	return app.run (args);
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
		
		string idris_label = afni("ala ma kota");
		
		Gtk.Label label = new Gtk.Label (idris_label);
		main_window.add (label);
		main_window.show_all ();
	}
}
