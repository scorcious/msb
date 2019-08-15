class Profile < User
  include PgSearch
  pg_search_scope :search_by_user_details,
    against: [:name, :city],
      using: { tsearch: { prefix: true } }
end
