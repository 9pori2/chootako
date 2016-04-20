class Image < ActiveRecord::Base
  default_scope {order(id: :desc)}
  scope :order_by_rate, -> {reorder(rate: :asc)}
  scope :label_like , ->(q){
    where(
      "label1 like ? or label2 like ? or label3 like ?",
      "%#{q}%","%#{q}%","%#{q}%")
  }
  scope :no_label, ->{
    where("
      (label1 is null or label1 = '') and 
      (label2 is null or label2 = '') and 
      (label3 is null or label3 = '')
    ")}

  def labels
    "#{self.label1} #{self.label2} #{self.label3}"
  end
end
