module ParallelLetterFrequency
  def self.count(texts)
    ractors = texts.map do |text|
      Ractor.new(text) do |input|
        input
          .downcase
          .gsub(/[^\p{Alpha}]/, '')
          .each_grapheme_cluster
          .tally
      end
    end

    ractors.each_with_object(Hash.new(0)) do |ractor, result|
      ractor.take.each { |k, v| result[k] += v }
    end
  end
end
