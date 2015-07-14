module Web::Controllers::Profiles
  class Show
    include Web::Action
    expose :user, :pictures

    def call(params)
      @user     = UserRepository.by_username(params[:id]) or halt 404
      @pictures = PictureRepository.by_user(@user)
    end
  end
end
