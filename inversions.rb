class Inversions
  def initialize(input_array)
    @input_array = input_array
    @inversions = 0
    # puts "Initializing with array: #{@input_array}"
  end

  def sort
    _sort(@input_array.clone)
  end

  def _sort(ary)
    if ary.size == 1
      return ary
    elsif ary.size == 2
      if ary[0] > ary[1]
        @inversions += 1
        return [ary[1], ary[0]]
      else
        return ary
      end
    else
      ### Now split into two halves and recurse
      ary_size = ary.size
      a1 = ary.slice(0..(-1+ary_size/2))
      a2 = ary.slice(ary_size/2..(ary_size-1))
      # puts "sort) Preparing for merge. a: #{ary_size}; a1: #{a1}; a2: #{a2}"
      # merge(_sort(a1),_sort(a2))
      b1 = _sort(a1)
      puts "b1: #{@inversions}"
      b2 = _sort(a2)
      puts "b2: #{@inversions}"
      b3 = merge(b1,b2)
      puts "merge: #{@inversions}"
      return b3
    end
  end

  def merge(a1, a2)
    # puts "Merge) a1: #{a1}; a2: #{a2}"
    result = []
    result_idx = 0
    a1_idx = 0
    a2_idx = 0
    a1_size = a1.size
    a2_size = a2.size
    while a1_idx < a1_size do
      # puts "result: #{result}"
      # puts "indixes: a1: #{a1_idx}; a2: #{a2_idx}; result: #{result_idx}"
      break if a2_idx >= a2_size
      if a1[a1_idx] < a2[a2_idx]
        result[result_idx] = a1[a1_idx]
        result_idx += 1
        a1_idx += 1
      elsif a1[a1_idx] > a2[a2_idx]
        result[result_idx] = a2[a2_idx]
        result_idx += 1
        # @inversions += 1
        @inversions += (a1_size - a1_idx)
        a2_idx += 1
      else
        result[result_idx] = a1[a1_idx]
        result_idx += 1
        a1_idx += 1
        result[result_idx] = a2[a2_idx]
        result_idx += 1
        a2_idx += 1
      end
    end
    # puts "result: #{result}"
    # puts "indixes: a1: #{a1_idx}; a2: #{a2_idx}; result: #{result_idx}"
    while a1_idx < a1_size do
      # Should only be entered if a2 was exhausted and we broke out of the loop above
      result[result_idx] = a1[a1_idx]
      result_idx += 1
      # NOTE: Don't re-count as they're already been counted
      # @inversions += 1
      # @inversions += a1_size - a1_idx
      a1_idx += 1
    end
    while a2_idx < a2.size do
      result[result_idx] = a2[a2_idx]
      result_idx += 1
      a2_idx += 1
    end
    return result
  end

  def inversions
    @inversions
  end

end
