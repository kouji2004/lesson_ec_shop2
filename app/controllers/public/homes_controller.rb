class Public::HomesController < ApplicationController
  def about
  end

  def top
    @itemes = Item.all
  end
end
