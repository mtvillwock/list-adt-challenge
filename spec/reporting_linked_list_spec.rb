require 'rspec'
require_relative '../reporting_linked_list'

class ReportingLinkedList
  def self.from_array(items)
    list = ReportingLinkedList.new
    items.reverse_each do |item|
      list = list.insert(item)
    end
    list
  end
end

describe ReportingLinkedList do
  let(:linked_list) { ReportingLinkedList.from_array([:a, :b, :c, :d]) }

  context "#length" do
    it "returns the length of the array" do
      expect(linked_list.length).to eq(4)
    end
  end

  context "#get" do
    it "returns the value at index" do
      expect(linked_list.get(0)).to eq(:a)
    end
  end

  context "#insert" do
    before do
      linked_list.insert(:new_item, 2)
    end

    it "inserts item at index" do
      expect(linked_list.get(2)).to eq(:new_item)
      expect(linked_list.length).to eq(5)
      linked_list.print_operations_data
    end

    it "shifts following items right" do
      expect(linked_list.get(3)).to eq(:c)
      expect(linked_list.get(4)).to eq(:d)
      expect(linked_list.get(5)).to eq(nil)
    end
  end

  context "#remove" do
    before do
      linked_list.remove(1)
    end

    it "inserts item at index" do
      expect(linked_list.length).to eq(3)
      expect(linked_list.get(1)).to eq(:c)
    end

    it "shifts following items left" do
      expect(linked_list.get(2)).to eq(:d)
      expect(linked_list.get(3)).to eq(nil)
    end
  end
end