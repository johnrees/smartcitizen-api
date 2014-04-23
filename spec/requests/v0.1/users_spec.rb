require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "Users" do

  let(:user) { FactoryGirl.create(:user, email: 'testuser@test.com') }

  get "/users" do
    example "Listing users" do
      FactoryGirl.create_list(:user, 5)
      do_request
      # test for the 200 status-code
      expect(status).to eq(200)
      json = JSON.parse(response_body)
      expect(json['users'].length).to eq(5)
    end
  end

  get "/users/:id" do

    let(:id) { user.id }

    example "Getting a single user" do
      do_request
      # test for the 200 status-code
      expect(status).to eq(200)
      json = JSON.parse(response_body)
      expect(json['user']['email']).to eq(user.email)
    end
  end

end