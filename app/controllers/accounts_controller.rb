class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)   
    if @account.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @account
    else
      render :new, status: :unprocessable_entity #Rails7.0からデフォルトでTurboが導入されており、バリデーションのエラーメッセージを表示させるためにはcreateアクションに以下のようにstatus: :unprocessable_entityを追加する必要がある。
    end
  end

  def show
    @account = Account.find(params[:id])
  end

  private

    def account_params
      params.require(:account).permit(:name, :email, :password, :password_confirmation)
    end
end
