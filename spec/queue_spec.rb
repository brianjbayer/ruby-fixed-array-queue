# frozen_string_literal: true

# Specification for Queue
require_relative '../queue'
require_relative './queue_helper'

RSpec.configure do |c|
  c.include QueueHelper
end

RSpec.describe Queue do
  subject(:new_queue) { described_class.new(4) }

  let(:queue_size) { 4 }
  let(:an_element) { 1 }

  context 'when created' do
    it 'is empty' do
      # To be more independently testable, there should be a
      # public way to inspect if a queue is empty or full
      expect(new_queue.send(:empty?)).to be true
    end
  end

  describe '#enqueue' do
    context 'when not full' do
      it 'returns self' do
        expect(new_queue.enqueue(an_element)).to be new_queue
      end
    end

    context 'when full' do
      it 'returns nil' do
        full_queue = fill_queue(queue_size)
        expect(full_queue.enqueue(an_element)).to be_nil
      end
    end
  end

  describe '#dequeue' do
    context 'when empty' do
      it 'returns nil' do
        expect(new_queue.dequeue).to be_nil
      end
    end

    context 'when not empty' do
      it 'returns element at the front of the queue' do
        new_queue.enqueue(QueueHelper::FRONT_ELEMENT)
        new_queue.enqueue(QueueHelper::REAR_ELEMENT)
        expect(new_queue.dequeue).to be QueueHelper::FRONT_ELEMENT
      end
    end
  end

  describe '#size' do
    it 'returns the size specified when creating the queue' do
      expect(described_class.new(queue_size).size).to be queue_size
    end
  end
end
