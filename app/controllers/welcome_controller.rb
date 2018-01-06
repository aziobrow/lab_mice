class WelcomeController < ApplicationController
  def index
    @mice = Mouse.all
  end
end
