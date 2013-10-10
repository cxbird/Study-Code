class Product < ActiveRecord::Base
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
    #1、%r{\.(gif|jpg|png)$}i 在 rails4 中是不允许使用 $ 或者 ^ 的；
    #2、解决方法是 $ => \z，^ => \A.
    :with	=> %r{\.(gif|jpg|png)\z}i,
    :message	=> 'URL 地址必须是图片格式文件，如GIF、JPG或者PNG文件。'
  }
end
