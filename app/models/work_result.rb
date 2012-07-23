class WorkResult < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator_id
  has_many :view_records
  
  has_attached_file :image,  :styles => { :medium => "300x300>", :thumb => "100x100>" }
                    # :path => "/web/2012/:class/:id/:style/:basename.:extension",
                    # :url => "/web/2012/:class/:id/:style/:basename.:extension"

  
  # Tags
  acts_as_ordered_taggable


  # 创建查看记录
  def create_view_record(user)
    # 如果是自己查看自己页面就直接返回
    if self.creator_id == user.id
      return false
    end

    viewed = ViewRecord.where(:viewer_id => user.id, :work_result_id => self.id).exists?
    # 如果没有查看过，才添加相关的记录
    unless viewed then
      ViewRecord.create(:viewer => user, :work_result => self)
    end

  end
  # end create_view_record


  # 引用其它类
  include Comment::CommentableMethods

  # --- 给其他类扩展的方法
  module UserMethods
    def self.included(base)
      base.has_many :work_results, :class_name => 'WorkResult', :foreign_key => 'creator_id'
      base.send(:include, InstanceMethods)
    end
    
    module InstanceMethods
    
    end
  end
  # end UserMethods
  
end
