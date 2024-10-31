module PaginationHelper
  def paginate(collection, page, per_page = 20)
    offset = (page - 1) * per_page
    collection.limit(per_page).offset(offset)
  end

  def next_page(collection, chosen_path, per_size = 20)
    links = ""
    page = params[:page].to_i
    next_link = page == 0 ? 2 : page + 1

    if collection.size == per_size
      links = link_to "Next", send(chosen_path, page: next_link)
    end
  end

  def previous_page(collection, chosen_path, per_size = 20)
    links = ""
    page = params[:page].to_i
    previous_link = page - 1

    if page > 1
      links = link_to "Previous", send(chosen_path, page: previous_link)
    end
  end
end

# Source: https://www.geeksforgeeks.org/how-to-implement-pagination-in-ruby-on-rails/
