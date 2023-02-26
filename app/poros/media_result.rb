class MediaResult 
  attr_reader :id,
              :title,
              :type,
              :vote_average,
              :poster,
              :release_year

  def initialize(media_result_data)
    @id = media_result_data[:attributes][:id]
    @title = media_result_data[:attributes][:title]
    @type = media_result_data[:attributes][:media_type]
    @vote_average = media_result_data[:attributes][:vote_average]
    @poster = media_result_data[:attributes][:poster_path] || media_result_data[:attributes][:poster]
    @release_year = media_result_data[:attributes][:release_year]
  end

  def formatted_type 
    type.gsub("_", " ").titleize
  end
end