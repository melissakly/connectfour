# == Schema Information
#
# Table name: badges
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  wins       :integer          default(0)
#  user_id    :integer
#  losses     :integer          default(0)
#  wstreak    :integer          default(0)
#  lstreak    :integer          default(0)
#

class Badge < ActiveRecord::Base
	belongs_to :user, class_name: "User"
end
