class PictureRepository
  include Lotus::Repository
  MEDIUM_TYPE = 'image'.freeze

  def self.create_from_media(user, media)
    media.map do |medium|
      next unless medium.type == MEDIUM_TYPE

      by_instagram_id(medium) ||
        create(
          Picture.new(
            user_id:      user.id,
            instagram_id: medium.id,
            caption:      medium.caption && medium.caption.text,
            link:         medium.link,
            url:          medium.images[:standard_resolution].url
          )
        )
    end.compact
  end

  def self.by_user(user)
    query do
      where(user_id: user.id)
    end
  end

  private

  def self.by_instagram_id(medium)
    query do
      where(instagram_id: medium.id)
    end.first
  end
end
