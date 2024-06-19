class DashboardController < ApplicationController
  def index
    @total_messages_sent = Message.count
    @messages_sent_today = Message.where('created_at >= ?', Date.today).count
    @messages = Message.all
  end
end
