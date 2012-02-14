class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  after_create do |record|
      Activity.create(
        :user_id     => record.user_id,
        :category_id => record.question.category_id,
        :model_id    => record.id,
        :model_type  => record.class.to_s,
        :title       => record.question.title,
        :description => record.body,
        :action      => 'create',
      )
  end
  after_update do |record|
      Activity.create(
        :user_id     => record.user_id,
        :category_id => record.question.category_id,
        :model_id    => record.id,
        :model_type  => record.class.to_s,
        :title       => record.question.title,
        :description => record.body,
        :action      => 'update',
      )
  end
end
