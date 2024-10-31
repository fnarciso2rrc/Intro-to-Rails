module PaginationHelper
  def paginate(collection, page, per_page = 25)
    offset = (page - 1) * per_page
    collection.limit(per_page).offset(offset)
  end

  def page_link(collection, chosen_path, per_size = 25)
    links = ""
    page = params[:page].to_i
    previous_link = params[:page].to_i - 1
    next_link = params[:page].to_i + 1

    if page > 1
      links = link_to "Previous", send(chosen_path, page: previous_link)
    end
    if collection.size == per_size
      links = link_to "Next", send(chosen_path, page: next_link)
    end
  end
end

# Source: https://www.geeksforgeeks.org/how-to-implement-pagination-in-ruby-on-rails/
