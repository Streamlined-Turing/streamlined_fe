class Media
  attr_reader :id,
              :title,
              :poster,
              :description,
              :runtime,
              :type,
              :release_year,
              :rating,
              :trailer,
              :language,
              :audience_score,
              :trailer


  def initialize(data)
    @id = data[:id]
    @title = data[:attributes][:title]
    @poster = data[:attributes][:poster]
    @description = data[:attributes][:description]
    @genre = data[:attributes][:genres]
    @runtime = data[:attributes][:runtime]
    @type = data[:attributes][:type]
    @release_year = data[:attributes][:release_year]
    @rating = data[:attributes][:rating]
    @trailer = data[:attributes][:trailer]
    @language = data[:attributes][:language]
    @sub_services = data[:attributes][:sub_services]
    @audience_score = data[:attributes][:audience_score]
    @trailer = data[:attributes][:trailer]
  end

  def genres
    @genre.join(', ')
  end

  def sub_services
    @sub_services.join(', ')
  end
end
