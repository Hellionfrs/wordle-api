class UsersController < ApplicationController
  def create
    ip_address = request.remote_ip
    game_status = "playing"

    # Verificar si ya existe un usuario con la misma dirección IP
    existing_user = User.find_by(ip_address: ip_address)

    if existing_user
      render json: existing_user, status: :ok
    else
      user = User.create(ip_address: ip_address, game_status: game_status)

      if user.valid?
        render json: user, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  def update_status
    user = User.find_by(id: params[:id])

    if user
      if params[:game_status].in?(%w(playing won loss))
        user.update(game_status: params[:game_status])
        render json: user
      else
        render json: { error: "Invalid game status" }, status: :unprocessable_entity
      end
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :email)  # Añade los atributos permitidos para la creación de usuario
  end
end