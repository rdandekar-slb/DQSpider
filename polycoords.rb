# def max(a,b)
#     a>b ? a : b
# end

class Point
    attr_accessor :x, :y
    def initialize (x,y)
        @x = x
        @y = y
    end
end


class Segment
    attr_accessor :p1, :p2
    def initialize(p1,p2)
        @p1=Point.new(p1.x,p1.y)
        @p2=Point.new(p2.x,p2.y)
    end

    def getLength()
        return ( (p2.y-p1.y)**2 + (p2.x-p1.x)**2 )**0.5
    end

    def get_Slope_of_Line()
        return ((p2.y - p1.y) / (p2.x - p1.x))
    end

    def get_midPoint()
        return Point.new((p1.x+p2.x)/2,(p1.y+p2.y)/2)
    end
end


class RegularPolygon
    attr_accessor :point
    def initialize(numsides,radius)
        @number_of_sides = numsides
        if numsides < 4 
            @number_of_sides=4
        end
        @radius = radius
    end

    def calcvertices()
        @point=Array.new(@number_of_sides) 
        angle = 2 * Math::PI / @number_of_sides 
        
        (0..@number_of_sides-1).each do |i|
            @point[i] = Point.new((@radius * Math.cos(i * angle)).to_i, (@radius * Math.sin(i * angle)).to_i)
        end
        return nil
    end

    def movebyoffset(x,y)
        @number_of_sides.times do |i|
            @point[i].x += x
            @point[i].y += y 
        end
        return nil
    end

    def getdiagonals()
        a=Array.new
        one=0
        two=0
        (0..@number_of_sides-1).each do |i|
            max=0
            for j in (0..@number_of_sides-1) do
                if j != i
                    s=Segment.new(@point[i],@point[j])
                    # print s.getLength, max
                    if s.getLength > max
                        one=i
                        two=j
                        max=s.getLength
                    end
                end
            end
            a.push(Segment.new(@point[one],@point[two]))
        end
        return a
    end
    
end

class DQSpiderGeometry
    attr_accessor :radius, :number_of_points, :centrepoint, :polygon, :longest_diagonal_lines, :inner_polygon
    def initialize(radius, number_of_points, centrepoint=nil)
        @radius = radius
        @number_of_points = number_of_points
        @polygon = RegularPolygon.new(@number_of_points, @radius)
        @polygon.calcvertices
        @centrepoint = centrepoint unless centrepoint.nil?
        @polygon.movebyoffset(centrepoint.x,centrepoint.y) unless centrepoint.nil?
        @longest_diagonal_lines = @polygon.getdiagonals()
    end

    def get_vertices_for_svg()
        s=String.new('"')
        (0..@number_of_points-1).each do |i|
            s += @polygon.point[i].x.to_s + "," + @polygon.point[i].y.to_s + " "
        end
        s += '"'
        return s
    end
end