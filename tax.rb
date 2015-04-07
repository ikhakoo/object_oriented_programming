### Exercise 3 ###

class Tax

	attr_accessor :item_quantity, :item_type, :item_cost

	IMPORT_TAX = 1.05
	SALES_TAX = 1.10

	def initialize(item_quantity, item_type, item_cost)
		@item_type = item_type
		@item_cost = item_cost
		@item_quantity = item_quantity
		@total_taxes = 0
		@total_cost = 0
		add_tax
	end

	def to_s
			puts "Item: #{@item_type} Cost: $" "#{@item_cost}"
			puts "Sales Taxes: $" "#{@total_taxes}"
			puts "Total Cost: $" "#{@total_cost}"
	end

	def add_tax
		if @item_type.include?("books" || "medical" || "food")
			if @item_type.include?("imported")
				@total_taxes = 0
				@total_cost = @item_cost.to_i * IMPORT_TAX
				to_s
			else
				@total_taxes = 0 
				@total_cost = @item_cost
				to_s
			end
		else
			if @item_type.include?("imported")
				@total_taxes = ((@item_cost.to_i * IMPORT_TAX) * SALES_TAX) - (@item_cost.to_i * IMPORT_TAX)
				@total_cost = (@item_cost.to_i * IMPORT_TAX) * SALES_TAX
				to_s
			else
				@total_taxes = (@item_cost.to_i * SALES_TAX) - @item_cost.to_i
				@total_cost = @item_cost.to_i * SALES_TAX
				to_s
			end

		end

	end

	

end

my_tax = Tax.new("1", "books", "12.49")
my_tax

