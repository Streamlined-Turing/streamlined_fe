class Media
  attr_reader :id,
              :title,
              :poster,
              :poster_path,
              :description,
              :runtime,
              :type,
              :release_year,
              :rating,
              :trailer,
              :language,
              :audience_score,
              :trailer, 
              :vote_average


  def initialize(data)
    @id = data[:id]
    @title = data[:attributes][:title]
    @poster = data[:attributes][:poster]
    @poster_path = data[:attributes][:poster_path]
    @description = data[:attributes][:description]
    @genre = data[:attributes][:genres]
    @runtime = data[:attributes][:runtime]
    @type = data[:attributes][:media_type]
    @release_year = data[:attributes][:release_year]
    @rating = data[:attributes][:rating]
    @trailer = data[:attributes][:trailer]
    @language = data[:attributes][:language]
    @sub_services = data[:attributes][:sub_services]
    @audience_score = data[:attributes][:audience_score]
    @trailer = data[:attributes][:trailer]
    @vote_average = data[:attributes][:vote_average]
  end

  def genres
    @genre.join(', ')
  end

  def sub_services
    @sub_services.join(', ')
  end

  def formatted_type
    @type.gsub("_", " ").titleize
  end

  def round_vote 
    @vote_average.round(1)
  end
end
