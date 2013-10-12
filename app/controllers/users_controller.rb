def edit
  @user = User.find...
  @user.birthday = 18.years.ago if @user.birthday.nil?
end