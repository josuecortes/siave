class Contato < ActiveRecord::Base
 
  belongs_to :pessoa

  validates_presence_of :tipo, :numero, :pessoa_id
  
end
