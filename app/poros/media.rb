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
              :vote_average,
              :genre,
              :user_lists,
              :user_rating

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
    @user_lists = data[:attributes][:user_lists]
    @user_rating = data[:attributes][:user_rating]
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

  def trailer_id
    trailer.partition('=').last
  end
end
