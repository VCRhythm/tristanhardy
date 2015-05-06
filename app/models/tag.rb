# == Schema Information
#
# Table name: tags
#
#  id    :integer          not null, primary key
#  name  :string(255)
#  class :string
#

class Tag < ActiveRecord::Base
  default_scope { order("name") }

  has_many :manifests
  has_many :posts, through: :manifests
end
