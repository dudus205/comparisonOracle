drop table tabela_faktura;
drop type polskafaktura;
drop type niemieckafaktura;
drop type faktura;

CREATE OR REPLACE TYPE faktura AS OBJECT
(
    DATA       DATE,
    KWOTANETTO DECIMAL,
    CONSTRUCTOR FUNCTION faktura(DATA DATE) RETURN SELF AS RESULT,
    CONSTRUCTOR FUNCTION faktura(DATA DATE, KWOTANETTO DECIMAL) RETURN SELF AS RESULT,
    MEMBER FUNCTION STAWKAVAT RETURN INT,
    MEMBER FUNCTION WYLICZBRUTTO RETURN DECIMAL,
    MEMBER PROCEDURE DRUKUJ
) not final;

CREATE OR REPLACE TYPE BODY faktura AS
    CONSTRUCTOR FUNCTION faktura(DATA DATE) RETURN SELF AS RESULT IS
    BEGIN
        SELF.DATA := DATA;
        RETURN;
    END;
    CONSTRUCTOR FUNCTION faktura(DATA DATE, KWOTANETTO DECIMAL) RETURN SELF AS RESULT IS
    BEGIN
        SELF.DATA := DATA;
        SELF.KWOTANETTO := KWOTANETTO;
        RETURN;
    END;
    MEMBER FUNCTION STAWKAVAT RETURN INT IS
    BEGIN
        RETURN 1;
    END;
    MEMBER FUNCTION WYLICZBRUTTO RETURN DECIMAL IS
    BEGIN
        RETURN KWOTANETTO * ((STAWKAVAT / 100) + 1);
    END;
    MEMBER PROCEDURE DRUKUJ IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('');
    END;
END;

CREATE OR REPLACE TYPE polskafaktura UNDER faktura
(
    OVERRIDING MEMBER FUNCTION STAWKAVAT RETURN INT,
    OVERRIDING MEMBER PROCEDURE DRUKUJ
) instantiable final;

CREATE OR REPLACE TYPE BODY polskafaktura AS
    OVERRIDING MEMBER FUNCTION STAWKAVAT RETURN INT IS
    BEGIN
        RETURN 23;
    END;
    OVERRIDING MEMBER PROCEDURE DRUKUJ IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(SELF.DATA ||
                             ' Faktura PL ' ||
                             SELF.KWOTANETTO ||
                             ' Stawka VAT: ' ||
                             SELF.STAWKAVAT ||
                             ' Kwota Brutto: ' ||
                             SELF.WYLICZBRUTTO);
    END;
END;

CREATE OR REPLACE TYPE niemieckafaktura UNDER faktura
(
    OVERRIDING MEMBER FUNCTION STAWKAVAT RETURN INT,
    OVERRIDING MEMBER PROCEDURE DRUKUJ
) instantiable final;

CREATE OR REPLACE TYPE BODY niemieckafaktura AS
    OVERRIDING MEMBER FUNCTION STAWKAVAT RETURN INT IS
    BEGIN
        RETURN 19;
    END;
    OVERRIDING MEMBER PROCEDURE DRUKUJ IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(SELF.DATA ||
                             ' Faktura DE ' ||
                             SELF.KWOTANETTO ||
                             ' Stawka VAT: ' ||
                             SELF.STAWKAVAT ||
                             ' Kwota Brutto: ' ||
                             SELF.WYLICZBRUTTO);
    END;
END;

DECLARE
    f1 polskafaktura;
    f2 niemieckafaktura;
BEGIN
    f1 := polskafaktura(SYSDATE, 100);
    f1.DRUKUJ();
    f2 := niemieckafaktura(SYSDATE, 100);
    f2.DRUKUJ();
END;

CREATE TABLE tabela_faktura OF faktura;
INSERT INTO tabela_faktura
VALUES (polskafaktura(SYSDATE, 100));
INSERT INTO tabela_faktura
VALUES (niemieckafaktura(SYSDATE, 100));
SELECT f.*, f.STAWKAVAT(), f.WYLICZBRUTTO()
FROM tabela_faktura f;
SELECT COUNT(*)
FROM TABELA_FAKTURA;


