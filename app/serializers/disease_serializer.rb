class DiseaseSerializer < ActiveModel::Serializer
  attributes :id, :name, :best_bet_prescription

  def best_bet_prescription
    object.most_commonly_ordered_medication
  end
end
