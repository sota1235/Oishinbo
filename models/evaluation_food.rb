
module Oishinbo
  class EvaluationFood < ActiveRecord::Base
    belongs_to :evaluations
    belongs_to :foods
  end
end
