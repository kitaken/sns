class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  after_create do |record|
      Activity.create(
        :user_id     => record.user_id,
        :category_id => record.event.category_id,
        :model_id    => record.event.id,
        :model_type  => record.event.class.to_s,
        :title       => record.event.title,
        :description => record.event.body,
        :action      => record.rsvp,
      )
  end
  after_update do |record|
      Activity.create(
        :user_id     => record.user_id,
        :category_id => record.event.category_id,
        :model_id    => record.event.id,
        :model_type  => record.event.class.to_s,
        :title       => record.event.title,
        :description => record.event.body,
        :action      => record.rsvp,
      )
  end
end
