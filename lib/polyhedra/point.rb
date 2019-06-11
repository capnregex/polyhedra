class Polyhedra::Point
  include Math

  def initialize(x: nil, y: nil, z: nil, r: nil, phi: nil, theta: nil)
    @x = x ? Float(x) : nil
    @y = y ? Float(y) : nil
    @z = z ? Float(z) : nil
    @r = r ? Float(r) : nil
    @phi = phi ? Float(phi) : nil
    @theta = theta ? Float(theta) : nil
  end

  def x
    @x ||= @r * cos(@theta) * cos(@phi)
  end

  def y
    @y ||= @r * cos(@theta) * sin(@phi)
  end

  def z
    @z ||= @r * sin(@theta)
  end

  def r
    @r ||= sqrt( @x * @x + @y * @y + @z * @z )
  end

  def theta
    @theta ||= asin(@z / r)
  end

  def phi
    @phi ||= atan2(@y, @x)
  end
end
