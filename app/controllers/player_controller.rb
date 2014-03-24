class PlayerController < ApplicationController
  def create
    @player = Player.create
  end

end
