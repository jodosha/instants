require 'lotus/interactor'

class ImportPictures
  include Lotus::Interactor

  def initialize(username)
    @username = username
  end

  def call
    remote_user = fetch_remote_user
    user        = persist(remote_user)
    pictures    = fetch_pictures_for(user)
    download_images(pictures)
  end

  private

  def fetch_remote_user
    error! "Must provide an username" if @username.nil?

    if !user = Instagram.user_search(@username).first
      error! "User not found: #{ @username }"
    end

    user
  end

  def persist(remote_user)
    UserRepository.create_from_remote(remote_user)
  end

  def fetch_pictures_for(user)
    media = Instagram.user_recent_media(user.instagram_id, count: 100)
    PictureRepository.create_from_media(user, media)
  end

  def download_images(pictures)
    pictures.each(&:download)
  end
end
