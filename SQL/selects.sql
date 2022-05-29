

-- Klienci z największą ilością wygranych aukcji
-- Podzapytanie + COUNT
select CUSTOMER.NAME, CUSTOMER.SURNAME, WonAuctions
FROM (select CUSTOMER.ID, COUNT(A2.WINNERID) as WonAuctions
      from CUSTOMER
               join AUCTION A2 on CUSTOMER.ID = A2.WINNERID
      group by CUSTOMER.ID
      order by COUNT(A2.WINNERID) desc) s
         join CUSTOMER on CUSTOMER.ID = s.ID;

-- Średnia ilość ofert na aukcję złożoną przez klienta
-- Podzapytanie + AVG
select CUSTOMERID, AVG(BID.BID)
from BID
group by CUSTOMERID;


