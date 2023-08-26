class ApplicationController < ActionController::Base
  before_action :authenticate_user!  #ログインしていない場合、自動的にログインページへ遷移する
  before_action :configure_permitted_parameters, if: :devise_controller?  #deviseに関するコントローラの処理であれば、そのときだけconfigure_parmitted_parametersメソッドを実行する

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])  #サインアップ時のnameキーの内容の保存をpermitメソッドで許可する
  end
end

