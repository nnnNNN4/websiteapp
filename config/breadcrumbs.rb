crumb :top do
  link "Home", root_path
end

crumb :login do
  link "ログイン", new_user_session_path
  parent :top
end

crumb :signup do
  link "サインアップ", new_user_registration_path
  parent :top
end

crumb :review do
  link "レビュ一覧", reviews_path
  parent :top
end

crumb :game do
  link "ゲーム一覧", games_path
  parent :top
end

crumb :question do
  link "よくある質問", questions_path
  parent :top
end

crumb :developer do
  link "開発者メモ", developer_path
  parent :top
end

crumb :corporation do
  link "運営会社", corporation_path
  parent :top
end

crumb :terms do
  link "利用規約", terms_path
  parent :top
end

crumb :privacy do
  link "プライバシーポリシー", corporation_path
  parent :top
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).