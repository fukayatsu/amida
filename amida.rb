#!/usr/bin/env ruby

AMIDA_HEIGHT = 10
AMIDA_LINES = 5

class Amida
  def initialize(line_number)
    @line_number = line_number
    @goal = rand( line_number ) + 1
    @table = []
    1.upto AMIDA_HEIGHT do
      row = []
      prev = false
      1.upto line_number-1 do
        r = rand 100
        if !prev && r < 20 then
          prev = connect = true
        else
          prev = connect = false
        end
        row.push connect
      end
      @table.push row
    end
  end

  def show
    1.upto @line_number do |i|
      print i
      print '...' unless i == @line_number
    end

    print "\n\n"

    @table.each do |row|
      row.each do |connect|
        print '|'
        print connect ? '===' : '...'
      end
      print '|'
      puts
    end

    puts

    1.upto @line_number do |i|
      if i == @goal then
        print '!'
      else
        print '.'
      end
      print '...' unless i == @line_number
    end

  end
end

amida = Amida.new(AMIDA_LINES)
amida.show
