if object_id('dbo.TR_Basket_insert_update') is not null drop trigger dbo.TR_Basket_insert_update;
go

create trigger dbo.TR_Basket_insert_update on dbo.Basket 
for insert as
if @@ROWCOUNT > 1
begin
	update dbo.Basket
	set DiscountValue = (Basket.Value * 0.05) * Basket.Value
	from inserted
	where Basket.ID_SKU = inserted.ID_SKU
end
else
begin
	update dbo.Basket
	set DiscountValue = 0
	from inserted
	where Basket.ID_SKU = inserted.ID_SKU
end;
go