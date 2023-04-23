--1
    
select m.surface, a.street_name, ci.city_name, co.state_name,
case m.surface
when 400  then 'opulent'
else 'mare'
end
as "dimensiune"
from markets m, addresses a, cities ci, countries co
where m.address_code = a.address_code
and a.city_tag = ci.city_tag
and ci.state_tag = co.state_tag
order by 1 desc;

--2
with ang_spn as
(select *
from employees e, markets m, addresses a, cities c, countries s
where e.id_market = m.id_market and m.address_code = a.address_code
and a.city_tag = c.city_tag and c.state_tag = s.state_tag and s.state_name = initcap('spain'))
select trunc((sysdate-e.hire_date)/12) as "vechime",nvl(e.commission_quoef,0) as "comision"
from ang_spn e;

select * from employees;

--3
select m.id_market, lower(to_char(min(e.hire_date))) as "vechime maxima"
from markets m, employees e
where m.id_market = e.id_market
group by e.id_market
having count(*)>=2;

--4
select distinct p.prod_name,
decode(p.prod_type, 'CSM', 'NU', 'MEA', 'NU', 'DA') as "lacto-ovo-vegan?"
from products p,supply s
where p.id_prod = s.id_prod
and s.id_market in (select e.id_market
                    from employees e
                    where e.id_depart in (select d.id_depart
                                          from departments d
                                          where mod(d.id_depart,2) = 0));

--5                                        
select last_day(e.hire_date)
from employees e
where e.id_market in(select m.id_market
                     from markets m
                     where e.id_market = m.id_market
                     and m.address_code in (select a.address_code
                                            from addresses a
                                            where a.address_code = m.address_code and a.city_tag = 'BUC'));
                                            
--modificari date
--6
update products
set price = price + price * 10
where prod_type = 'DRY';

rollback;

--7
delete
from contain
where receipt_id in (select r.receipt_id
                    from contain r
                    group by receipt_id
                    having sum(quantity*id_prod)<10);

--8
update maintainance_companies
set monthly_payment = monthly_payment - 100
where lower(company_type) = 'cleaning'
and id_comp in (select mc.id_comp
                from maintainance_companies mc
                where mc.cleaning_frequency <= 7);
                
--9
with
a1 as (select * from employees e full outer join departments d on e.id_depart =d.id_depart),
a2 as (select * from markets m full outer join addresses a on m.address_code = a.address_code),
a12 as (select * from a1 full outer join a2 on a1.id_market = a2.id_market)
select distinct last_name, surface, street_name, c.city_name
from a12,cities c
where departmentg_name like 'Sales' and c.city_tag = a12.city_tag;

--10
SELECT id_market
FROM   supply
MINUS
SELECT id_market
from(SELECT id_market, id_prod
     FROM (SELECT DISTINCT id_market 
           FROM supply) t1, (SELECT id_prod
                             FROM products) t2
      MINUS
      SELECT id_market, id_prod
      FROM supply) t3;
      
--11
SELECT id_supplier
FROM supply
WHERE id_market IN (SELECT id_market
                     FROM markets)
GROUP BY id_supplier
HAVING COUNT(id_market)=(SELECT COUNT(*)
                         FROM markets);

--neoptimizat                    
select surface
from markets, (select * 
               from departments d, employees e
               where d.id_depart = e.id_depart
               and departmentg_name = 'Sales') aux
where markets.id_market = aux.id_market;

--optimizat
select surface
from (select surface,id_market from markets) a, (select * 
                                                from employees
                                                where id_depart = (select id_depart
                                                                   from departments
                                                                   where departmentg_name = 'Sales')) b
where a.id_market = b.id_market;