class Task
  
  include Core::Mongoid::Document
  
  ## validations ##
  
  validates_presence_of :title

  ## associations ##
  
  embedded_in :user, :inverse_of => :tasks
  
  ## fields ##
  
  field :title, :type => String
  field :complete, :type => Boolean, :default => false
  field :project_title, :type => String
  
  ## Scope ##
  
  scope :active, :where => {:complete => false}

  ## methods ##
  
  # Returns true if a project is complete
  #
  # @param 
  # @return [Boolean]
  
  def complete?
    self.complete
  end
end