module PaginationHelper
  def paginate(collection, page, per_page = 25)
    offset = (page - 1) * per_page
    collection.limit(per_page).offset(offset)
  end

  def page_link(collection, page, per_page)
    links = ""

    if page.to_i > 1
      links = link_to "Previous", root_path(page: params[:page].to_i - 1)
    end
    if total_pages.size == per_page
      link = link_to "Next", root_path(page: params[:page].to_i + 1)
    end
  end
end

# Source: https://www.geeksforgeeks.org/how-to-implement-pagination-in-ruby-on-rails/
