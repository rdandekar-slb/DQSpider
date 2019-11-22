require 'sinatra'

Choices ={
    'HAM' => 'Hamburger', 'PIZ' => 'Pizza', 'CUR' => 'Curry', 'NOO' => 'Noodles'
}

get '/' do
    @title = 'Stage Gated Project Development'
    # 'Hello, voter'
    erb :index
end

post '/cast' do
    @title = 'Thanks for your vote'
    @vote = params['vote']
    # puts @vote
    # puts Choices[@vote]
    erb :cast
end

get '/dg1' do
    @title = 'Decision Gate 1'
    erb :dg1
end

get '/results' do
    @votes = { 'HAM' => 7, 'PIZ' => 5, 'CUR' => 3 }
    erb :results
end