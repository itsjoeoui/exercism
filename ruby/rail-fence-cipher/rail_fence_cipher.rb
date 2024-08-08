module RailFenceCipher
  def self.encode(text, rail_count)
    translate(text, encode_map(text.size, rail_count))
  end

  def self.decode(text, rail_count)
    translate(text, decode_map(text.size, rail_count))
  end

  def self.encode_map(text_length, rail_count)
    (0..text_length).group_by do |string_index|
      rail_group(string_index, rail_count)
    end.values.flatten.zip(0..text_length).to_h
  end

  def self.decode_map(text_length, rail_count)
    encode_map(text_length, rail_count).invert
  end

  def self.rail_group(index, depth)
    rail_map = (1..depth).to_a + (2..(depth - 1)).to_a.reverse
    rail_map[index % rail_map.size]
  end

  def self.translate(text, text_map)
    text_map.map.with_object([]) { |(a, b), out| out[b] = text[a] }.join
  end
end
