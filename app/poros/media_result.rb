class MediaResult 
  attr_reader :id,
              :title,
              :type,
              :vote_average,
              :poster

  def initialize(media_result_data)
    @id = media_result_data[:attributes][:id]
    @title = media_result_data[:attributes][:title]
    @type = media_result_data[:attributes][:media_type]
    @vote_average = media_result_data[:attributes][:vote_average]
    @poster = media_result_data[:attributes][:poster_path]
  end

  def formatted_type 
    type.gsub("_", " ").titleize
  end
end