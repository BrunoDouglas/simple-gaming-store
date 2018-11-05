ActiveAdmin.register Page do
  permit_params :name, :content

  form do |f|
    f.inputs 'Page' do
      f.input :name
      f.input :content, as: :froala_editor
    end
    f.actions
  end
end
