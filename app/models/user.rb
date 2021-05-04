class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth)
    user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)
    user.email = auth.info.email
    user.name = auth.info.name
    user.avatar = auth.info.image

    user.save
    user
  end
end