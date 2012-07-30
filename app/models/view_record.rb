class ViewRecord < ActiveRecord::Base
  belongs_to :viewer, :class_name => 'User', :foreign_key => :viewer_id
  belongs_to :work_result, :class_name => 'WorkResult', :foreign_key => :work_result_id

  validates :viewer_id, :presence => true,:uniqueness => {:scope => :work_result_id}
  validates :work_result, :presence => true


  # begin UserMethods
  module UserMethods
    def self.included(base)
      base.has_many :view_recordss, :class_name => 'ViewRecord', :foreign_key => :viewer_id

      base.send(:include, InstanceMethods)
    end
    
    module InstanceMethods
      #Todo
    end
  end
  # end UserMethods


end
