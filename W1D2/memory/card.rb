class Card
  attr_reader :face_value
  attr_accessor :face_up

  def initialize(face_value)
    @face_value = face_value
    @face_up = false

  end

  def card_info
    if @face_up
      @face_value
    else
      nil
    end
  end

  def hide
    self.face_up = false
  end

  def reveal
    self.face_up = true
  end


end
