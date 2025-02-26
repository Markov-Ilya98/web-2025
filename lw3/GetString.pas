PROGRAM WorkWithQueryString(INPUT, OUTPUT);
USES
  DOS;

FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  QueryString, SearchKey, Value: STRING;
  PosKey, PosEnd: INTEGER;
BEGIN
  QueryString := GetEnv('QUERY_STRING');  
  SearchKey := Key + '=';  
  PosKey := Pos(SearchKey, QueryString);  
  IF PosKey > 0 
  THEN
    BEGIN
      PosEnd := Pos('&', Copy(QueryString, PosKey + Length(SearchKey), Length(QueryString)));
      IF PosEnd = 0 
      THEN
        Value := Copy(QueryString, PosKey + Length(SearchKey), Length(QueryString))
      ELSE
        Value := Copy(QueryString, PosKey + Length(SearchKey), PosEnd - 1)
    END
  ELSE
    Value := '';
  GetQueryStringParameter := Value
END;

BEGIN {WorkWithQueryString}
  WRITELN('Content-Type: text/plain');
  WRITELN;

  WRITELN('First Name: ', GetQueryStringParameter('first_name'));
  WRITELN('Last Name: ', GetQueryStringParameter('last_name'));
  WRITELN('Age: ', GetQueryStringParameter('age'))
END. {WorkWithQueryString}
