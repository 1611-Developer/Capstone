class AddYoutubeAndGithubLinkToProjects < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :youtube_link, :string
    add_column :projects, :github_link, :string
  end
end
