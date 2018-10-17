class HospitalSerializer < ActiveModel::Serializer
  attributes :id, :name, :most_prescribed_drug

  def most_prescribed_drug
    object.most_prescribed
  end
end
