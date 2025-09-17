class RenameYoutubeLinkToVideoLinkInProjects < ActiveRecord::Migration[8.0]
  def change
    rename_column :projects, :youtube_link, :video_link
  end
end
