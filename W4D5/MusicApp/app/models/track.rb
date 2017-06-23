# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  category   :string           not null
#  lyrics     :text
#

class Track < ActiveRecord::Base

  validates :album_id, :category, presence: true
  
  belongs_to :album,
  primary_key: :id,
  foreign_key: :album_id,
  class_name: :Album
end
