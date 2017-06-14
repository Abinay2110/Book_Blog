class Bview < ApplicationRecord

belongs_to :user
:title
:summary
:author
:rating

has_many:comments ,dependent: :destroy
accepts_nested_attributes_for :comments, allow_destroy: true
validates :title, presence: true, length:{ maximum: 15}
validates :summary, presence: true, length:{ minimum: 5}

end
