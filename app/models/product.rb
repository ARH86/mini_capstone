class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, length: { minimum: 20}
  validates :description, length: { maximum: 200}
  validates :description, presence: true
  validates :image_url, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  belongs_to :supplier 
  has_many :images

  def is_discounted?
     price < 100
  end
  

  def tax
   price * 0.09
  end

  def total
   price + tax 
  end

end
