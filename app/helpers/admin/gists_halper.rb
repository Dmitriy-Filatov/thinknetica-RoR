module Admin::GistsHelper
  def hash_of_url(url)
    url.split('/').last
  end
end
