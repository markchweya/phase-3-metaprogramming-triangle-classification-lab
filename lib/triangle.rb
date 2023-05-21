class Triangle
  # write code here

  def initialize(base, height, hypotenuse)
    @base = base
    @height = height
    @hypotenuse = hypotenuse
    validate_triangle
  end

  def kind

    if equilateral?
      :equilateral
    elsif isosceles?
      :isosceles
    else
    :scalene
    end
  end
  class TriangleError < StandardError
    def message
      'You must provide the values of each side of the triangle.'
    end
  end

  private
  def validate_triangle
    unless valid_triangle?
      raise TriangleError, "Invalid triangle sides: #{@base}, #{@height}, #{@hypotenuse}"
    end
  end
  def equilateral?
    @base == @height && @base == @hypotenuse
  end

  def isosceles?
    @base == @height || @base == @hypotenuse || @height == @hypotenuse
  end

  def valid_triangle?
    positive_sides = [@hypotenuse, @height, @base].all? {|side| side > 0}
    triangle_inequality = (@base + @height > @hypotenuse) && (@base + @hypotenuse > @height) && (@hypotenuse + @height > @base)
    positive_sides && triangle_inequality
  end

end

t1 = Triangle.new(3,4,5)


puts t1.kind
end
