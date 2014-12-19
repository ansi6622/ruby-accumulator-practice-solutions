# Write code that will take an array and return an array where every element
# has been transformed by the block, and also pass the current index of the
# element to the block.
#
# You can only use the `#each` method on the input array
def map_with_index(array, &block)
  result = []
  index = 0
  array.each do |element|
    result << block.call(element, index)
    index += 1
  end
  result
end

require 'rspec'
require 'rspec/autorun'

RSpec.describe '#to_sentence' do

  it 'returns an empty array when given an empty array' do
    actual = map_with_index([]) do |element, index|
      index * 10
    end

    expect(actual).to eq([])
  end

  it 'returns an array of objects modified by the block, which has access to the index' do
    input = ['foo', 'bar', 'baz']
    expected = ['FOO = 0', 'BAR = 1', 'BAZ = 2']
    actual = map_with_index(input) do |element, index|
      "#{element.upcase} = #{index}"
    end
    expect(actual).to eq(expected)

    input = [1,2,3]
    expected = [1, 3, 5]
    actual = map_with_index(input) do |element, index|
      element + index
    end
    expect(actual).to eq(expected)
  end

end
