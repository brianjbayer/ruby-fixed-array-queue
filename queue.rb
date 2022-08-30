# frozen_string_literal: true

# Queue is a first-in-first-out data structure in which the two major operations are
# enqueue and dequeue.
#  - enqueue adds an element to the rear of the queue
#  - dequeue removes an element from the front of the queue.
class Queue
  attr_reader :size

  def initialize(size)
    @size = size
    @fixed_store = Array.new(size)
    @rear = 0
    @front = 0
    @count = 0
  end

  def dequeue
    return nil if empty?

    element = @fixed_store[@front]
    @front = next_index(@front)
    @count -= 1
    element
  end

  def enqueue(element)
    return nil if full? || element.nil?

    @fixed_store[@rear] = element
    @rear = next_index(@rear)
    @count += 1
    self
  end

  private

  def full?
    @count == @size
  end

  def empty?
    @count.zero?
  end

  # Methods unique to my implementation
  def next_index(curr_index)
    (curr_index + 1) % @size
  end
end
