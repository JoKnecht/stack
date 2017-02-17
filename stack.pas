unit stack;

{$mode objfpc}{$H+}

interface
  type
    PKellerElement = ^TKellerElement; // Zeiger auf Kellerelement

    TKellerElement = record           // Kellerelement mit Daten & ZEiger auf
      daten: integer;                 // unter ihm liegendes Element
      darunter: PKellerElement;       // ist dieses NIL -> letztes Element
    end;

  function stack_init():PKellerElement;
  procedure stack_destroy(var kelleranfang:PKellerElement);
  procedure stack_push(var kelleranfang:PKellerElement; data: integer);
  function stack_pop(var kelleranfang:PKellerElement):integer;

implementation

  function stack_init():PKellerElement;
  var kelleranfang:PKellerElement;
  begin
      kelleranfang:= nil;
      result:= kelleranfang;
  end;

  procedure stack_destroy(var kelleranfang:PKellerElement);
  var a: PKellerElement;
  begin
       while (kelleranfang^.darunter<>nil) do begin
         a:= kelleranfang;
         kelleranfang:= a^.darunter;
         dispose(a);
       end;
       dispose(kelleranfang);
       kelleranfang:= nil;
  end;

  procedure stack_push(var kelleranfang:PKellerElement; data: integer);
  var neuesElement: PKellerElement;
  begin
       new(neuesElement);
       neuesElement^.daten:= data;
       neuesElement^.darunter:= kelleranfang;
       kelleranfang:= neuesElement;
  end;

  function stack_pop(var kelleranfang:PKellerElement):integer;
  var a: PKellerElement;
    erg: integer;
  begin
       erg:= kelleranfang^.daten;
       a:= kelleranfang;
       kelleranfang:= kelleranfang^.darunter;
       Dispose(a);
       writeln(erg, ' vom STACK entfernt!');   // kann auskommentiert werden
       result:= erg;
  end;

end.
