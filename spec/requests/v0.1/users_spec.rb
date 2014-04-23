describe "Users API" do

  it "retrieves a list of users" do
    FactoryGirl.create_list(:user, 10)
    get "/users"
    # test for the 200 status-code
    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json['users'].length).to eq(10)
  end


  it "retrieves a single user" do
    user = FactoryGirl.create(:user, email: 'testuser@test.com')
    get "/users/#{user.id}"
    # test for the 200 status-code
    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json['user']['email']).to eq(user.email)
  end

end