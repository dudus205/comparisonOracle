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


select * from auction;
select * from customer;

-- select pokazujacy ranking wg. najwiekszej liczby opini o pracowniku
SELECT
    em.id
    ,em.name
    ,em.surname
    ,fb.cnt_emp
    ,rank() over(order by cnt_emp) rank
FROM
    employee em
JOIN (
    SELECT
        employeeid,
        COUNT(employeeid) cnt_emp
    FROM
        feedback
    group by
        employeeid
) fb ON fb.employeeid = em.id
order by rank() over(order by cnt_emp) desc
;

--select z joinem na like
SELECT
    veh.manufacturer
    ,veh.name
    ,invi.grossvalue
FROM
    invoice_item invi
JOIN vehicle veh ON
    invi.vehicleid = veh.id
    AND UPPER(veh.manufacturer) like '%IN%'
order by invi.grossvalue desc
;

