class MediaResult 
  attr_reader :id,
              :title,
              :type,
              :audience_score,
              :poster

  def initialize(media_result_data)
    @id = media_result_data[:attributes][:id]
    @title = media_result_data[:attributes][:title]
    @type = media_result_data[:attributes][:type]
    @audience_score = media_result_data[:attributes][:audience_score]
    @poster = media_result_data[:attributes][:poster]
  end
end