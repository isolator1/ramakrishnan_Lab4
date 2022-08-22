CREATE DEFINER=`root`@`localhost` PROCEDURE `Question_9`()
BEGIN
select SUPP_ID, SUPP_NAME ,SUM_OF_RATING/COUNT_OF_RATING AS Rating,
case 
when rating =5 then 'Excellent Service'
when rating=4 then 'Good Service'
when rating=2 then 'Average Service'
else 'Poor Service' end as Type_of_Service
from (select sp.SUPP_ID supp_id,SUPP_NAME supp_name,RAT_RATSTARS rating,sum(RAT_RATSTARS) sum_of_rating,count(RAT_RATSTARS) count_of_rating
from supplier s INNER JOIN supplier_pricing sp 
on s.supp_id = sp.supp_id INNER JOIN orders ord ON sp.PRICING_ID=ord.PRICING_ID
INNER JOIN rating r ON ORD.ORD_ID = R.ORD_ID GROUP BY SP.SUPP_ID) a;
END