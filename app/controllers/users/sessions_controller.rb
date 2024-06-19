class Users::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    super
    send_sign_in_sms if current_user
  end

  # DELETE /resource/sign_out
  def destroy
    send_sign_out_sms if current_user
    super
  end

  private

  def send_sign_in_sms
    SmsNotifier.new(to: current_user.phone_number, body: "Hi #{current_user.username}, you have successfully signed in.").send_sms
  end

  def send_sign_out_sms
    SmsNotifier.new(to: current_user.phone_number, body: "Hi #{current_user.username}, you have successfully signed out.").send_sms
  end
end
