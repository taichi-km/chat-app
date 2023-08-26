class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)  #ユーザー情報が格納されているcurrent_userメソッドを使用して、ログインしているユーザーの情報を更新する
      redirect_to root_path  #更新情報を保存できた場合、トップページへ遷移する
    else
      render :edit, status: :unprocessable_entity  #保存できなかった場合、renderメソッドでeditページへ。unprocessable_entity=｢何らかの処理に失敗した｣
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)  #permitメソッドでnameとemailの編集を許可する
  end

end
