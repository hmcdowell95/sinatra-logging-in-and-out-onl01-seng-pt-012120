class Helpers
  
  def self.current_user(session)
    a = User.find(session[:user_id])
    a
  end
  
  def self.is_logged_in?(session)
    !!session[:user_id]
  end
  
end