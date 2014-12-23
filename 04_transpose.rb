# Write code that can transpose an array of arrays into another array of arrays
#
# You can use any methods you like on the input array except `#transpose`
def transpose(array)
  return [] if array.empty?
  result = []
  array.first.length.times do |i|
    array.each_with_index do |inner, inner_index|
      result[i] ||= []
      result[i] << array[inner_index][i]
    end
  end
  result
end

# Alternate solution:
# def transpose(array)
#   return [] if array == []
#   Array.new(array.first.length) do |i|
#     Array.new(array.length) do |j|
#       array[j][i]
#     end
#   end
# end

require 'rspec'
require 'rspec/autorun'

RSpec.describe '#transpose' do

  it 'returns an empty array when given an empty array' do
    actual = transpose([])

    expect(actual).to eq([])
  end

  it 'returns a transposed array of arrays' do
    input = [
      ['top', 'middle', 'bottom'],
      ['top', 'middle', 'bottom'],
      ['top', 'middle', 'bottom'],
    ]
    expected = [
      ['top', 'top', 'top'],
      ['middle', 'middle', 'middle'],
      ['bottom', 'bottom', 'bottom'],
    ]
    actual = transpose(input)

    expect(actual).to eq(expected)
  end

  it 'returns properly transposed rectangular matrices' do
    input = [
      [1,2],
      [3,4],
      [5,6]
    ]

    expected = [
      [1,3,5],
      [2,4,6]
    ]
    actual = transpose(input)

    expect(actual).to eq(expected)
  end
end
