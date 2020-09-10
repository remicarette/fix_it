require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#email" do

    it 'can read the email' do
      user = User.new(email: "test@gmail.com")
      expect(user.email).to eq("test@gmail.com")
    end

  end
end
