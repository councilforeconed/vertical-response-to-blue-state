class Output
  
  def initialize
    @data = []
  end
  
  def <<(row)
    @data << row
  end
  
  def to_s
    @data.join("\n")
  end
  
end