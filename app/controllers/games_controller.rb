require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    response = open("https://wagon-dictionary.herokuapp.com/#{params[:word]}")
    json = JSON.parse(response.read)
    if json['found']
      @result = "Congratulations! #{params[:word]} is a valid English word!"
    else
      @result = "Sorry but #{params[:word]} does not seem to be a valid English word..."
    end
  end
end
