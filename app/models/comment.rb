class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :applicant, :polymorphic => true
end
