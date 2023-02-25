class Media

  def initialize(data)
    @id = data[:id]
    @title = data[:attributes][:title]
    @poster = data[:attributes][:poster]
    @description = data[:attributes][:description]
    @genre = data[:attributes][:genres]
    @runtime = data[:attributes][:runtime]
    @type = data[:attributes][:type]
    @year = data[:attributes][:release_year]
    @us_rating = data[:attributes][:us_rating]
    @trailer = data[:attributes][:trailer]
    @language = data[:attributes][:language]
    @streaming_sources = data[:attributes][:sub_services]
    @audience_score = data[:attributes][:audience_score]
    # TODO: Temporary, didn't want to write out the attr_readers
    # until we are sure they won't change.
    instance_variables.each do |inst_var|
      self.class.send(:attr_reader, inst_var.to_s[1..].to_sym)
    end
  end

  def genres
    @genre.join(', ')
  end

  def sources
    @streaming_sources.join(', ')
  end
end
