class Product < ActiveRecord::Base
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
    :with	=> %r{\.(gif|jpg|png)$}i,
    :message	=> 'URL 地址必须是图片格式文件，如GIF、JPG或者PNG文件'
  }
end
