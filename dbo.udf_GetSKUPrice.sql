if object_id('dbo.udf_GetSKUPrice') is not null drop function dbo.udf_GetSKUPrice;
go

create function dbo.udf_GetSKUPrice
(
	@ID_SKU as int
)
returns  decimal(18, 2)
as
  begin
    declare @result decimal(18, 2);
	select 
		@result = sum(b.Value)/sum(b.Quantity)
	from dbo.Basket as b
	where b.ID_SKU = @ID_SKU
	if (@result IS NULL)
        SET @result = 0;
    return @result;
  end;
go