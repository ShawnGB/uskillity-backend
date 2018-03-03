class PostmarkTemplateMailDelivery
  class << self
    # do not deliver if in test environment
    def deliver(**opts)
      client.deliver_with_template(opts)
    end

    private

    def client
      @client ||= Postmark::ApiClient.new(ENV['POSTMARK_API_TOKEN'], http_open_timeout: 15)
    end

  end
end
