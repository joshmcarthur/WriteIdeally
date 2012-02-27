require 'spec_helper'

describe "WriteIdeally API" do
  describe "GET /api/v1/ideas" do

    before(:all) do
      5.times { @ideas ||= []; @ideas << Factory(:idea) }
    end

    it "load ideas" do
      get '/api/v1/ideas.json'
      response.status.should eql(200)
      ideas = JSON.parse(response.body)['collection']
      ideas.should have_exactly(5).things
    end

    it "paginates ideas" do
      # First page
      get '/api/v1/ideas.json?per_page=2'
      body = JSON.parse(response.body)
      body['collection'].should have_exactly(2).things
      body['pagination']['page'].should eql(1)
      body['pagination']['total_pages'].should eql(3)


      # Last page
      get '/api/v1/ideas.json?per_page=2&page=3'
      body = JSON.parse(response.body)
      body['pagination']['page'].should eql(3)
      body['collection'].should have_exactly(1).things
    end
  end
end
