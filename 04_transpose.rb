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

require 'rspec'
require 'rspec/autorun'

RSpec.describe '#transpose' do

  it 'returns an empty array when given an empty array' do
    actual = transpose([])

    expect(actual).to eq([])
  end

  it 'returns string joined by commas with the last two words joined by the word "and"' do
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

end
