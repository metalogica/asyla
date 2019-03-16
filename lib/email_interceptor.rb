class EmailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject}"
    message.to = [ 'test@blackhole.postmarkapp.com.' ]
  end
end
