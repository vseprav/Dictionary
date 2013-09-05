# == Schema Information
#
# Table name: vocabularies
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  project_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Vocabulary < ActiveRecord::Base
  belongs_to :project
end
