class UserTest < ActiveSupport::TestCase

  test "email should return email" do
    puts "hello"
    Message.all
    user = User.new(email: "test@gmail.com")
    assert_equal "test@gmail.com", user.email
  end
end
