class RenameGithubLinkToRepositoryLinkInProjects < ActiveRecord::Migration[8.0]
  def change
    rename_column :projects, :github_link, :repository_link
  end
end
