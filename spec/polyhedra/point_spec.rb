RSpec.describe Polyhedra::Point do
  pi = Math::PI
  p1 = pi / 2
  p2 = pi
  p3 = -p1

  def self.test_point(x,y,z,r,phi,theta)
    cart = "Cartesian x:%5.2f y:%5.2f z:%5.2f"%[x,y,z]
    spher = "Spherical r:%5.2f p:%5.2f t:%5.2f"%[r,phi,theta]
    it "#{cart} to #{spher}" do
      point= Polyhedra::Point.new(x: x, y: y, z: z)
      expect(point.r).to be_within(0.0000001).of(r)
      expect(point.phi).to be_within(0.0000001).of(phi)
      expect(point.theta).to be_within(0.0000001).of(theta)
    end
    it "#{spher} to #{cart}" do
      point= Polyhedra::Point.new(r: r, phi: phi, theta: theta)
      expect(point.x).to be_within(0.0000001).of(x)
      expect(point.y).to be_within(0.0000001).of(y)
      expect(point.z).to be_within(0.0000001).of(z)
    end
  end

  context "polar" do
    test_point( 1, 0, 0, 1,  0,  0)
    test_point( 0, 1, 0, 1, p1,  0)
    test_point(-1, 0, 0, 1, p2,  0)
    test_point( 0,-1, 0, 1, p3,  0)
    test_point( 0, 0, 1, 1,  0, p1)
    test_point( 0, 0,-1, 1,  0, p3)
  end
  context "corners" do
    test_point( 1, 1, 0, Math.sqrt(2), pi/4,  0)
    test_point( 1, 1, 1, Math.sqrt(3), pi/4, Math.atan2(1,Math.sqrt(2)))
  end
  context "pathagorian" do
    test_point( 3, 4, 0, 5, Math.atan2(4,3), 0)
    test_point( 4, 3, 0, 5, Math.atan2(3,4), 0)
    test_point( 0, 3, 4, 5, p1, Math.atan2(4,3))
  end
end

