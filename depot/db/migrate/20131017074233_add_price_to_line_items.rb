class AddPriceToLineItems < ActiveRecord::Migration
  def self.up
		# 添加字段
    add_column :line_items, :price, :decimal, :precision => 8, :scale => 2

		# 复制数据
		say_with_time "更新价格数据....." do
			LineItem.all.each do |line_item|
				#line_item.update_attribute :price, line_item.product.price
				line_item.price = line_item.product.price
				line_item.save
			end
		end
  end

	def self.down
		remove_column :line_items, :price
	end
end
