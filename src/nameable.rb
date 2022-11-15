class Nameable
  def correct_name
    raise NotImplementedErrorj, "#{self.class} has not implemented method '#{__method__}'"
  end
end
