module Services
    class PushMore
        WEBHOOK_URL = "https://pushmore.io/webhook/rfo4wsRwttXrXrb3DwtXhS4Q"

        def initialize(body)
            @body = body
        end

        def deliver
            req = Net::HTTP::Post.new(webhook_url.path)
            req.body = @body
            res = Net::HTTP.new(webhook_url.host, webhook_url.port)
            res.use_ssl = true
            res.verify_mode = OpenSSL::SSL::VERIFY_PEER
            res.start { |http| http.request(req) }
        end

        private

        def webhook_url
            URI.parse WEBHOOK_URL
        end
    end
end