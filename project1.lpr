program project1;

uses stack, sysutils;

var kelleranfang: PKellerElement;
  Eingabe, Ausgabe: integer;

  // ------- gehört nicht zu ADT STACK ------------------------
    procedure ausgabe_stackinhalt(kelleranfang:PKellerElement);
    var i: integer;
      a: PKellerElement;
    begin
         a:= kelleranfang;   // sonst wird Kelleranfang durch Ausgabe verändert!!
         writeln('STACK-Inhalt');
         writeln('------------');
         i:= 1;
         if (a = nil) then writeln('STACK ist leer',chr(10));
         while (a <> nil) do begin
             writeln(i,'. Element: ', a^.daten, chr(10));
             inc(i);
             a:= a^.darunter;
         end;
    end;

begin
    writeln('STACKTEST');
    writeln('---------',chr(10));
    kelleranfang:= stack_init();
    readln(Eingabe);
    stack_push(kelleranfang, Eingabe);
    readln(Eingabe);
    stack_push(kelleranfang, Eingabe);

    ausgabe_stackinhalt(kelleranfang);
    ausgabe_stackinhalt(kelleranfang);

    Ausgabe:= stack_pop(kelleranfang);
    writeln('pop() -> ', Ausgabe);

    ausgabe_stackinhalt(kelleranfang);

    stack_destroy(kelleranfang);
    ausgabe_stackinhalt(kelleranfang);

    sleep(15000);
end.

