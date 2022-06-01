class Api::V1::GreetingsController < ApplicationController
  def index
    greetings = ['Hello friend', 'Bonjour frere', 'Salut tonton', 'Jambo kaka', 'Good morning']

    @datas = Greeting.all

    @datas = greetings.map { |g| Greeting.create(message: g) } if @datas.empty?

    render json: Greeting.order(Arel.sql('RANDOM()')).first
  end
end
