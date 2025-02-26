program HelloCGI;
uses dos;

var
  QueryString, Name: string;
  PosName: integer;

begin
  { Вывод HTTP-заголовков }
  writeln('Content-Type: text/plain');
  writeln;

  { Получение QUERY_STRING }
  QueryString := GetEnv('QUERY_STRING');

  { Поиск 'name=' в строке запроса }
  PosName := Pos('name=', QueryString);

  if PosName > 0 then
    Name := Copy(QueryString, PosName + 5, Length(QueryString) - PosName - 4)  
  else
    Name := 'Anonymous';

  writeln('Hello dear, ', Name, '!');
end.
