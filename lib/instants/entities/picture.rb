require 'faraday'

class Picture
  ROOT = Lotus.root.join('public', 'assets')
  URL  = "/assets"

  include Lotus::Entity
  attributes :user_id, :instagram_id, :caption, :link, :url

  def download
    return if exist?

    path.dirname.mkpath
    path.binwrite(
      Faraday.new.get(url).body
    )
  end

  def relative_url
    "#{ URL }/#{ user_id }/#{ filename }"
  end

  private

  def exist?
    path.exist?
  end

  def path
    ROOT.join(user_id.to_s, filename)
  end

  def filename
    instagram_id + extension
  end

  def extension
    ::File.extname(url)
  end
end
