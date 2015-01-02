class WelcomeController < ApplicationController
  def index
    generator = Generator.new
    @random_last_name = generator.last_name
    @random_first_name = generator.first_name
  end
end