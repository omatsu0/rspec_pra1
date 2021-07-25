class User < ApplicationRecord
  def name
    [firstname, lastname].join(' ')
  end
end
