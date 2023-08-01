if object_id('dbo.vw_SKUPrice') is not null drop view dbo.vw_SKUPrice;
go

create view dbo.vw_SKUPrice
as
select
	s.ID
	,s.Code
	,s.Name
	,dbo.udf_GetSKUPrice(ID) as SKUPrice
from dbo.SKU as s