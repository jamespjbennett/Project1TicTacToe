class SessionsController < Devise::SessionsController
  def new
    super
    Ttt.create
  end
end