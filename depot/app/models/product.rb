class Product < ActiveRecord::Base
	default_scope :order => 'title'
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
    #1、%r{\.(gif|jpg|png)$}i 在 rails4 中是不允许使用 $ 或者 ^ 的；
    #2、解决方法是 $ => \z，^ => \A.
    :with	=> %r{\.(gif|jpg|png)\z}i,
    :message	=> 'URL 地址必须是图片格式文件，如GIF、JPG或者PNG文件。'
  }
	validates :title, length: {
		minimum: 2,
	 	maximum: 50,
		too_short: "至少必须有 %{count} 个字符。",
		too_long: "%{count} 个字符是最大许可。"
	 	#:message => '产品名称长度不能超过10个字符。'
	}


	private

		#ensure that there ara no line items referencing this product
		def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Line Items present')
				return false
			end
		end
end
