class User < ApplicationRecord

  attr_reader :password
  validates :username, uniqueness: true, presence: true
  # also make sure the session_token is unique!
  validates :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  # important to allow a nil password because password is not set when we fetch a user back from the DB
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

# solutions (also correct! but doesn't use helper method of is_password?)
#   def self.find_by_credentials(username, password)
#   user = User.find_by(username: username)
#   return user if user && BCrypt::Password.new(user.password_digest).is_password?(password)
#   nil
#   end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    # need to convert stored string password_digest back into a Bcrypt object to use the is_password? method on it
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    # returns new session_token
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
