class WorkResult < ActiveRecord::Base
  has_attached_file :image,  :styles => { :medium => "300x300>", :thumb => "100x100>" }
                    # :path => "/web/2012/:class/:id/:style/:basename.:extension",
                    # :url => "/web/2012/:class/:id/:style/:basename.:extension"

  # --- 给其他类扩展的方法
  module UserMethods
    def self.included(base)
      base.has_many :work_results, :class_name => 'WorkResult', :foreign_key => 'creator_id'
      base.send(:include, InstanceMethods)
    end
    
    module InstanceMethods
    
    end
  end
end
