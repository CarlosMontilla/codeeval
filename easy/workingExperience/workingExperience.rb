#!/usr/bin/ruby
# Calcules the working experience given a list of dates

@months_dict = {
  "Jan" => 1,
  "Feb" => 2,
  "Mar" => 3,
  "Apr" => 4,
  "May" => 5,
  "Jun" => 6,
  "Jul" => 7,
  "Aug" => 8,
  "Sep" => 9,
  "Oct" => 10,
  "Nov" => 11,
  "Dec" => 12
}

class MyDate
  attr_accessor :month, :year
  include Comparable

  def initialize(m, y)
    @month = m
    @year = y
  end

  def to_s
    return @month.to_s + "-" + @year.to_s
  end

  def <=> d
    if year > d.year then return 1
    elsif year < d.year then return -1
    elsif month > d.month then return 1
    elsif month < d.month then return -1
    else return 0
    end
  end

  def monthsBetween d
    if self <= d then
      if year == d.year then return d.month - month
      else return d.month + self.monthsBetween(MyDate.new(12, d.year - 1))
      end
    else return d.monthsBetween self
    end
  end
end


class MyDatePeriod
  attr_accessor :starts, :ends
  include Comparable

  def initialize(d1, d2)
    if d1 < d2 then
      @starts = d1
      @ends = d2
    else
      @starts = d2
      @ends = d1
    end
  end

  def to_s
    return "from: " + starts.to_s + ", to: " + ends.to_s
  end

  def timeLength
    return starts.monthsBetween ends
  end

  def extendsEnds d1
    if d1 > ends then return MyDatePeriod.new(starts, d1)
    else raise "Period can't be extended"
    end
  end

  def extendsBothSides(d1, d2)
    return MyDatePeriod.new(d1, d2)
  end

  def extendsStarts d1
    if d1 < starts then return MyDatePeriod.new(d1, ends)
    else raise "Period can't be extended"
    end
    return self
  end


  def extends p
    if (p.ends < self.starts) or (p.starts > self.ends) then return -1
    elsif (p.starts >= self.starts) and (p.ends <= self.ends) then return self# p is inside self
    elsif (p.starts >= self.starts) and (p.ends >= self.ends) then return self.extendsEnds(p.ends)
    elsif (p.starts <= self.starts) and (p.ends <= self.ends) then return self.extendsStarts(p.starts)
    else return extendsBothSides(p.starts, p.ends)
    end
    return -1
  end

  def <=> p
    if (self.starts <= p.starts) and (self.ends >= p.ends) then return 0
    elsif (self.starts >= p.starts) and (self.ends <= p.ends) then return 0
    elsif (self.starts > p.starts) and (self.starts >= p.ends) then return 1
    elsif (self.starts >= p.starts) and (self.ends > p.ends) then return 1
    elsif (self.starts < p.starts) and (self.ends < p.ends) then return -1
    elsif (self.ends <= p.starts) and (self.ends <= p.starts) then return -1
    end
    puts""
    print self.to_s + " and " + p.to_s
    puts
    raise "It can be compared"
  end
end

pOld = 0

File.open(ARGV[0],"r").read.split("\n").each do |line|
  periods = line.split("; ")
  timePeriods = []
  periods.each do |p|
    dates = p.split("-")
    d1 = dates[0].split(" ")
    d2 = dates[1].split(" ")

    if d2[0] == "Dec" then d2 = [1, (d2[1].to_i + 1)]
    else d2 = [@months_dict[d2[0]] + 1, d2[1].to_i]
    end
#    d2 = [@months_dict[d2[0]], d2[1].to_i]

    period = MyDatePeriod.new(MyDate.new(@months_dict[d1[0]],d1[1].to_i),
                              MyDate.new(d2[0], d2[1]))
    timePeriods.push(period)
  end

  timePeriods.sort!

  begin
    n_merge = 0
    noOverlap = [timePeriods[0]]
    (1...(timePeriods.length)).each do |p|
      if noOverlap[noOverlap.length - 1].extends(timePeriods[p]) == -1 then
        noOverlap.push(timePeriods[p])
      else
        noOverlap[noOverlap.length - 1] = noOverlap[noOverlap.length - 1].extends(timePeriods[p])
        n_merge += 1
      end
    end
    timePeriods = noOverlap.clone
  end while n_merge != 0

  sum = 0
  noOverlap.each {|p| sum += p.timeLength}#puts p.timeLength + 1}
  puts sum / 12

end
