class Sender
  def initialize(command_queue:, response_queue:)
    @command_queue = command_queue
    @response_queue = response_queue
  end

  def queue(cmd)
    @response_queue.add(command: cmd, status: 'queued')
  end
end
