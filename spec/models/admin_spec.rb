require 'rails_helper'

describe Admin do
 it {should have_many :posts}
 it {should have_many :comments}
end
