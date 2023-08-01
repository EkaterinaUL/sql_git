if object_id('dbo.usp_MakeFamilyPurchase ', 'P') is not null drop proc dbo.usp_MakeFamilyPurchase;
go

create proc dbo.usp_MakeFamilyPurchase
	@FamilySurName as varchar(255)
as
if @FamilySurName IS NULL OR @FamilySurName not in (select SurName from dbo.Family)
begin
   print 'This family does not exist'  
   return
end
update f
 set f.BudgetValue -= (select sum(Value) from dbo.Basket)
 from dbo.Family as f
	inner join dbo.Basket as b
		on f.id = b.ID_Family
where f.SurName = @FamilySurName;
go