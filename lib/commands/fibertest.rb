require 'fiber'
f = Fiber.new do
  p 't'
  Fiber.yield
  p 't2'
end

f.resume
f.resume
p f.alive?
