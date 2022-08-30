# frozen_string_literal: true

require_relative '../queue'

# Helper methods for queue_spec
module QueueHelper
  FRONT_ELEMENT = 1
  REAR_ELEMENT = 2

  def fill_queue(queue_size)
    queue = Queue.new(queue_size)
    queue_size.times { queue.enqueue('x') }
    queue
  end
end
