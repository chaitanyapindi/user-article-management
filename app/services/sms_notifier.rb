class SmsNotifier
  def initialize(to:, body:)
    @to = to
    @body = body
  end

  def send_sms
    response = HTTP.post('https://textbelt.com/text', form: {
      phone: @to,
      message: @body,
      key: ENV['TEXTBELT_AUTH_TOKEN']
    })
    Rails.logger.info("SMS sent: #{response.parse}")
    handle_response(response)
  rescue StandardError => e
    Rails.logger.error("Failed to send SMS: #{e.message}")
  end

  private

  def handle_response(response)
    if response.status
      # Handle success, e.g., save to database
      Message.create(to: @to, body: @body, status: 'success')
    else
      # Handle failure
      Message.create(to: @to, body: @body, status: 'failure')
    end
  end
end
