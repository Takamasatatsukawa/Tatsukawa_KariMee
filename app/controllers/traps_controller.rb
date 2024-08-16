class TrapsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_hunting_license, only: [:create]

 

    def create
      @trap = current_user.traps.build(trap_params)  # current_userに関連付けてトラップを作成
      # binding.irb
      if @trap.save
        render json: @trap.as_json(include: { user: { only: [:name, :contact_information] }  }), status: :created
      else
        render json: @trap.errors, status: :unprocessable_entity
      end
    end
  
    def index
       @traps = Trap.includes(:user).all # N+1問題を避けるためにincludesを使用
      end
  
    def destroy
      trap = Trap.find_by(id: params[:id]) # params[:id]を使用してIDを取得
      if trap  # @trapではなくtrapを使います
        trap.destroy
        head :no_content
      else
        render json: { error: "Trap not found" }, status: :not_found
      end
    rescue => e
      render json: { error: e.message }, status: :internal_server_error
    end
    

    private

    def check_hunting_license
      unless current_user.net_hunting_license || current_user.trap_hunting_license
        flash[:alert] = "トラップを設置するには網猟免許またはわな猟免許が必要です。"
        redirect_to root_path
      end
    end
  
    def trap_params
      params.require(:trap).permit(:lat, :lng, :trap_type, :start_date, :end_date)
    end
  end
  