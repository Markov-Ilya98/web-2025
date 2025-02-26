program HelloCGI;
uses dos;

var
  QueryString, Name: string;
  PosName: integer;

begin
  { ����� HTTP-���������� }
  writeln('Content-Type: text/plain');
  writeln;

  { ��������� QUERY_STRING }
  QueryString := GetEnv('QUERY_STRING');

  { ����� 'name=' � ������ ������� }
  PosName := Pos('name=', QueryString);

  if PosName > 0 then
    Name := Copy(QueryString, PosName + 5, Length(QueryString) - PosName - 4)  
  else
    Name := 'Anonymous';

  writeln('Hello dear, ', Name, '!');
end.
