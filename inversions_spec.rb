require 'rspec'
require_relative 'inversions'

RSpec.describe Inversions do
  describe '#sort' do
    it 'sorts simple, sorted array' do
      tstary = %w{1 2 3 4 5 6}
      inversions = Inversions.new(tstary)
      expect(inversions.sort).to eql tstary
    end
    it 'sorts small, unsorted array' do
      tstary = %w{2 1}
      inversions = Inversions.new(tstary)
      expect(inversions.sort).to eql tstary.sort
    end
    it 'sorts larger, unsorted array' do
      tstary = %w{1 2 4 3}
      inversions = Inversions.new(tstary)
      expect(inversions.sort).to eql tstary.sort
    end
    it 'sorts bigger array' do
      puts "Starting bigger array test"
      tstary = %w{17 43 55 1 2 99 3 99 3 101 5}
      inversions = Inversions.new(tstary)
      expect(inversions.sort).to eql tstary.sort
    end
  end
  describe '#inversions' do
    it 'counts inversions on simple, sorted array' do
      tstary = %w{1 2 3 4 5 6}
      inversions = Inversions.new(tstary)
      expect(inversions.sort).to eql tstary
      expect(inversions.inversions).to eql 0
    end
    it 'counts inversions on a small, no split-inversions array' do
      tstary = %w{2 1 4 3}
      inversions = Inversions.new(tstary)
      expect(inversions.sort).to eql tstary.sort
      expect(inversions.inversions).to eql 2
    end
    it 'counts inversions on a larger, no split-inversions array' do
      tstary = %w{1 3 2 4 6 5}
      inversions = Inversions.new(tstary)
      expect(inversions.sort).to eql tstary.sort
      expect(inversions.inversions).to eql 2
    end
    it 'counts inversions on a 4-item array' do
      tstary = %w{4 5 3 2}
      inversions = Inversions.new(tstary)
      expect(inversions.sort).to eql tstary.sort
      expect(inversions.inversions).to eql 5
    end
    it 'counts inversions on 4-item reversed array' do
      tstary = %w{5 4 3 2}
      inversions = Inversions.new(tstary)
      inversions.sort
      expect(inversions.inversions).to eql 6
    end
    it 'counts inversions on a six-item reersed array' do
      tstary = %w{6 5 4 3 2 1}
      inversions = Inversions.new(tstary)
      expect(inversions.sort).to eql tstary.sort
      expect(inversions.inversions).to eql 15
    end
    it 'counts inversions on a left/right-inversion only array' do
      tstary = %w{1 3 2 4 6 5}
      inversions = Inversions.new(tstary)
      expect(inversions.sort).to eql tstary.sort
      expect(inversions.inversions).to eql 2
    end
    it 'counts inverstions on a 5-item array' do
      tstary = %w{5 4 3 2 1}
      inversions = Inversions.new(tstary)
      expect(inversions.sort).to eql tstary.sort
      expect(inversions.inversions).to eql 10
    end
    it 'counts inversions on split-inversion only array' do
      tstary = %w{1 3 5 2 4 6}
      inversions = Inversions.new(tstary)
      expect(inversions.sort).to eql tstary.sort
      expect(inversions.inversions).to eql 3
    end
    it 'counts inversions on a bigger array' do
      puts "Starting bigger array count"
      tstary = %w{17 43 55 1 2 99 3 99 3 101 5}
      inversions = Inversions.new(tstary)
      expect(inversions.sort).to eql tstary.sort
    end
    it 'counts inversions for a small input file' do
      tstary = File.open('integerArray.test1').readlines
      inversions = Inversions.new(tstary)
      expect(inversions.sort).to eql tstary.sort
      expect(inversions.inversions).to eql 33
    end
    xit 'counts inversions for a small file-like data' do
      tstary = %w{54044 14108 79294 29649 25260 60660 2995 53777 49689 9083 16122 90436}
      inversions = Inversions.new(tstary)
      expect(inversions.sort).to eql tstary.sort
      expect(inversions.inversions).to eql 33
    end
  end

end

puts "finished tests!"

