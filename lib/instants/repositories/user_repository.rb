class UserRepository
  include Lotus::Repository

  def self.create_from_remote(remote_user)
    by_instagram_id(remote_user) ||
      create(
        User.new(
          instagram_id: remote_user.id,
          username:     remote_user.username
        )
      )
  end

  def self.by_username(username)
    query do
      where(username: username)
    end.first
  end

  private

  def self.by_instagram_id(remote_user)
    query do
      where(instagram_id: remote_user.id)
    end.first
  end
end
