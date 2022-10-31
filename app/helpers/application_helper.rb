module ApplicationHelper
  FLASH_MESSAGE_STYLE = { notice: 'success', alert: 'danger' }

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def greeting_in_header
    current_user.first_name || current_user.email
  end
end
