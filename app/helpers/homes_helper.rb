module HomesHelper

  def to_sentence(object)
    return object.taxons.map(&:name).join(", ").upcase
  end

  def available(object)
    return true if object < Time.zone.now
  end

end
