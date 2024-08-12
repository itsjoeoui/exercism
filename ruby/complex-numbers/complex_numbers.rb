class ComplexNumber
  attr_reader :real, :imaginary

  def initialize(real, imaginary = 0)
    @real = real
    @imaginary = imaginary
  end

  def +(other)
    ComplexNumber.new(real + other.real, imaginary + other.imaginary)
  end

  def -(other)
    ComplexNumber.new(real - other.real, imaginary - other.imaginary)
  end

  def *(other)
    ComplexNumber.new(
      real * other.real - imaginary * other.imaginary,
      real * other.imaginary + imaginary * other.real
    )
  end

  def /(other)
    self * other.inv
  end

  def ==(other)
    (self - other).abs < 1e-15
  end

  def abs
    Math.sqrt(real**2 + imaginary**2)
  end

  def conjugate
    ComplexNumber.new(real, -imaginary)
  end

  def exp
    ComplexNumber.new(Math.exp(real) * Math.cos(imaginary), Math.exp(real) * Math.sin(imaginary))
  end

  def inv
    denominator = abs**2
    ComplexNumber.new(real / denominator, -imaginary / denominator)
  end
end
