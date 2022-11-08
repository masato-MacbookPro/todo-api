module ApiError::Base < StandardError
  attr_accessor :code, :detail
end
