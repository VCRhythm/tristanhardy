# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  subject    :text
#  body       :text
#  date       :datetime
#  username   :string(255)
#  email      :string(255)
#  website    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  post_id    :integer
#  user_id    :integer
#

class Comment < ActiveRecord::Base
  belongs_to :post
end
