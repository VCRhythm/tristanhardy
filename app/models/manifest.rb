# == Schema Information
#
# Table name: manifests
#
#  id      :integer          not null, primary key
#  post_id :integer
#  tag_id  :integer
#

class Manifest < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag
end
