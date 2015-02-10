class RegistrationsController < Devise::RegistrationsController
  def create
    super
    Ttt.create
  end
end