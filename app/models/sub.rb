# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :string           not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ActiveRecord::Base
  validates :title, :description, :moderator, presence: true


  belongs_to(
    :moderator,
    class_name: :User,
    primary_key: :id,
    foreign_key: :moderator_id
    )
end
