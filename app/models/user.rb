# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true}
  validates :email, :session_token, uniqueness: true
  attr_reader :password
  after_initialize :ensure_session_token
  # attr_accessor :email


  has_many(
    :subs,
    class_name: :Sub,
    primary_key: :id,
    foreign_key: :moderator_id
    )

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    save!
    self.session_token
  end

  def ensure_session_token
    self.session_token = self.session_token || User.generate_session_token
  end

  def self.find_by_credentials(email, password)
    @user = User.find_by(email: email)
    if @user.is_password?(password)
      return @user
    end
    nil
  end
end
