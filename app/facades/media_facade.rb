class MediaFacade
  def self.media(id)
    media_data = MediaService.media(id)[:data]
    Media.new(media_data)
  end
end
