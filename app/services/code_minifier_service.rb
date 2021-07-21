class CodeMinifierService < ApplicationService
  def call(code)
    connection = connection_open
    connection.start
    channel = connection.create_channel
    queue = channel.queue('hello')
    channel.default_exchange.publish("#{code[:id]}: #{code_minify(raw_code(code))}", routing_key: queue.name)
    connection.close
  end

  private

  def code_minify(code)
    Terser.new.compile(code)
  end

  def raw_code(code)
    code.nil? ? nil : code[:raw_code]
  end

  def connection_open
    Bunny.new('amqp://guest:guest@localhost:5672', automatically_recover: false)
  end
end
