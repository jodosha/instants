class PictureRepository
  include Lotus::Repository
  MEDIA_TYPE = 'image'.freeze

  def self.create_from_media(user, media)
    return unless media.type == MEDIA_TYPE

    by_instagram_id(media) ||
      create(
        Picture.new(
          user_id:      user.id,
          instagram_id: media.id,
          caption:      media.caption && media.caption.text,
          link:         media.link,
          url:          media.images[:standard_resolution].url
        )
      )
  end

  def self.by_user(user)
    query do
      where(user_id: user.id)
    end
  end

  private

  def self.by_instagram_id(media)
    query do
      where(instagram_id: media.id)
    end.first
  end
end
