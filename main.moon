Mat2={} -- Mat2 class reference hack
PI=math.pi
fstr=(v,d=3)->
 string.format("%.#{d}f", v)

Rot2=(r)->
 Mat2(math.cos(r),-math.sin(r),
      math.sin(r),math.cos(r))
Ref2=(r)->
 Mat2(math.cos(2*r),math.sin(2*r),
      math.sin(2*r),-math.cos(2*r))
class Vec2
 new:(@x=0,@y=0) =>
 len:=>(@x^2+@y^2)^0.5
 __add:(v2)=>Vec2(@x+v2.x, @y+v2.y)
 __sub:(v2)=>Vec2(@x-v2.x, @y-v2.y)
 __mul:(v)=>
  if type(v)=="number"
   Vec2(@x*v,@y*v)
  elseif v.__class==Mat2
   Vec2(@x*v.a+@y*v.c,@x*v.b+@y*v.d)
  elseif v.__class==Vec2
   Vec2(@x*v.x,@y*v.y)
  else nil
 __div:(v)=>Vec2(@x/v,@y/v)
 __tostring:=>
  "Vec2(#{fstr(@x)},#{fstr(@y)})"
 norm:=>(@/@\len())
 rotated:(r,o)=>
  if o==nil
   Rot2(r)*@
  else
   (@-o)\rotated(r)+o
 reflected:(r)=>Ref2(r)*@

class Mat2
 new:(@a=0,@b=0,@c=0,@d=0)=>
 det:=>@a*@d-@b*@c
 __add:(m2)=>
  Mat2(@a+m2.a,@b+m2.b,@c+m2.c,@d+m2.d)
 __sub:(m2)=>
  Mat2(@a-m2.a,@b-m2.b,@c-m2.c,@d-m2.d)
 __mul:(v)=>
  if type(v)=="number"
   Mat2(@a*v,@b*v,@c*v,@d*v)
  elseif v.__class==Vec2
   Vec2(@a*v.x+@b*v.y,@c*v.x+@d*v.y)
  elseif v.__class==Mat2
   Mat2(@a*v.a+@b*v.c, @a*v.b+@b*v.d,
        @c*v.a+@d*v.c, @c*v.b+@d*v.d)
  else nil
 __div:(v)=>Mat2(@a/v,@b/v,@c/v,@d/v)
 __tostring:=>
  "Mat2(#{fstr(@a)},#{fstr(@b)},#{fstr(@c)},#{fstr(@d)})"

p1=Vec2(10,0)
p2=Vec2(2,1)
t=0
-- rotate p1 around p2
export TIC=->
 cls(0)
 p3=p1\rotated(t/PI, p2)
 line(p2.x,p2.y,p3.y,p3.y,4)
 t=t+1
