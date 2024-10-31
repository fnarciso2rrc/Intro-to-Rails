module PaginationHelper
  def paginate(collection, page, per_page = 25)
    offset = (page - 1) * per_page
    collection.limit(per_page).offset(offset)
  end
end

# Source: https://www.geeksforgeeks.org/how-to-implement-pagination-in-ruby-on-rails/
