Rails.application.routes.draw do
  match 'ckeditor/images', :to => 'ckeditor#images'
  match 'ckeditor/files',  :to => 'ckeditor#files'
  match 'ckeditor/create/:kind', :to => 'ckeditor#create'
end
