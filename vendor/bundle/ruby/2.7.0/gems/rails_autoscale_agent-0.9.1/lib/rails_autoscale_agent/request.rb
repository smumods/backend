# frozen_string_literal: true

module RailsAutoscaleAgent
  class Request
    include Logger

    def initialize(env, config)
      @config = config
      @id = env['HTTP_X_REQUEST_ID']
      @size = env['rack.input'].respond_to?(:size) ? env['rack.input'].size : 0
      @request_body_wait = env['puma.request_body_wait'].to_i

      @entered_queue_at = if unix_millis = env['HTTP_X_REQUEST_START']
        Time.at(unix_millis.to_f / 1000)
      elsif config.dev_mode?
        # In dev mode, fake a queue time of 0-1000ms
        Time.now - rand + @request_body_wait
      end
    end

    def ignore?
      @config.ignore_large_requests? && @size > @config.max_request_size
    end

    def queue_time
      if @entered_queue_at
        queue_time = ((Time.now - @entered_queue_at) * 1000).to_i

        # Subtract the time Puma spent waiting on the request body. It's irrelevant to capacity-related queue time.
        # Without this, slow clients and large request payloads will skew queue time.
        queue_time -= @request_body_wait

        logger.debug "Request queue_time=#{queue_time}ms body_wait=#{@request_body_wait}ms request_id=#{@id} size=#{@size}"

        # Safeguard against negative queue times (should not happen in practice)
        queue_time > 0 ? queue_time : 0
      end
    end
  end
end
