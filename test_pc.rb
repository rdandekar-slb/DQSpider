require './polycoords.rb'
# numpoints=6
# mypoly=RegularPolygon.new(numpoints,180)
# mypoly.calcvertices
# centrepoint=Point.new(200,200)
# mypoly.movebyoffset(centrepoint.x, centrepoint.y)

# (0..numpoints-1).each do |i|
#     print mypoly.point[i].x,",",mypoly.point[i].y," "
# end
# puts

# numdiagonals = (numpoints*(numpoints-3))/2
# print numdiagonals



#compute lengths of all 
#a=Array.new
# one=0
# two=0
# (0..numpoints-1).each do |i|
#     max=0
#     for j in (0..numpoints-1) do
#         if j != i
#             s=Segment.new(mypoly.point[i],mypoly.point[j])
#             # print s.getLength, max
#             if s.getLength > max
#                 one=i
#                 two=j
#                 max=s.getLength
#             end
#         end
#     end
#     # print "one = ",one," two = ",two
#     # puts
#     a = Segment.new(mypoly.point[one],mypoly.point[two])
#     print "x1=",a.p1.x," y1=",a.p1.y," x2=",a.p2.x," y2= ",a.p2.y
#     # print "x1=",mypoly.point[one].x," y1=",mypoly.point[one].y," x2=",mypoly.point[two].x," y2= ",mypoly.point[two].y
#     puts
# end

# a=Array.new
# a.push 0.65
# a.push 0.55
# a.push 0.22
# a.push 0.75
# a.push 0.67
# a.push 0.9
# # puts a.length
# #calculate points on line
# polypoints = Array.new
# (0..numpoints-1).each do |i|
#     x=centrepoint.x*a[i] + mypoly.point[i].x*(1-a[i])
#     y=centrepoint.y*a[i] + mypoly.point[i].y*(1-a[i])
#     polypoints.push Point.new(x.to_i,y.to_i)
# end

# (0..numpoints-1).each do |i|
#     print polypoints[i].x,", ",polypoints[i].y
#     puts
# end


puts "-----------------------------------------------------"
x=DQSpiderGeometry.new(180,6,Point.new(200,200))
print x.get_vertices_for_svg+"\n"
s = x.longest_diagonal_lines
s.length.times { 
    |i|
    print s[i].p1.x.to_s+" "+s[i].p1.y.to_s+ ";"+s[i].p2.x.to_s+" "+s[i].p2.y.to_s+"\n"
}
puts "-----------------------------------------------------"