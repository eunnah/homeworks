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

  validates :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  after_initialize :ensure_session_token
  validates :password, length: { minimum: 6, allow_nil: true }
  attr_reader :password

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil # MEMORIZE THIS LINE
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16) # memorize this!!!
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  # must use self.password_Digest, NOT @password_digest b/c we are in ActiveRecord
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password) # MEMORIZE THIS!!!
    # don't need to save the user yet (save only after signing up and logging out)
  end

  def is_password?(password)
    pass = BCrypt::Password.new(self.password_digest)
    pass.is_password?(password) # study how this method works for BCrypt::Password
  end

  private

  # throws an error if you try to set session_token and NOT self.session_token
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
