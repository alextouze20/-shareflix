class AccountSeatsController < ApplicationController
  def create
    skip_authorization
    @account_seat = AccountSeat.new(strong_seat)
    # @account = PlatformAccount.find(params[:account_seat][:platform_account_id])
    # @account_seat.platform_account = @account
    # @account_seat.user = current_user
    if @account_seat.save
      redirect_to platforms_path
    else
      @account = @account_seat.platform_account
      render 'platform_accounts/show'
    end
  end

  def update
    skip_authorization
    @account_seat = AccountSeat.find(params[:id])
    strong_seat[:id] = params[:id]
    if account_seat.update(strong_seat)
      redirect_to platforms_path
    else
      # account = @account_seat.platform_account
      # render 'platform_accounts/show'
      print 'stuff'
    end
  end

  private

  def strong_seat
    params.require(:account_seat).permit(:platform_account_id, :user_id, :status)
  end
end
