require 'spec_helper'

describe "sending messages:" do
  let(:tool) { Tool.new(name: 'my_tool', version: 'v1.2.3') }
  let(:command_queue) { double("command_queue") }
  let(:response_queue) { double("response_queue") }

  it "sent messages go to both send queue and response queue" do
    cmd = InstallCmd.new(tool: tool,
                         command: 'install',
                         site: 'site1',
                         id: 12345
                        )
    sender = Sender.new(command_queue: command_queue,
                        response_queue: response_queue
                       )

    expect(response_queue).to receive(:add).with({command: cmd, status: 'queued'})
    sender.queue(cmd)
  end
end
