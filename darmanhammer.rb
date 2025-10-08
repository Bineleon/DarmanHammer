require 'gosu'

class WhackARuby < Gosu::Window
  def initialize
    super 800, 600, false
    self.caption = "Darmanhammer"
    @image = Gosu::Image.new('./assets/darmanin.png', tileable: false)
    @x = 200
    @y = 200
    @width = 50
    @height = 43
    @velocity_x = 3
    @velocity_y = 3
    @visible = 0
    @hammer_image = Gosu::Image.new('./assets/hammer.png', tileable: false)
    @hit = 0
    @font = Gosu::Font.new(30)
    @font_big = Gosu::Font.new(60)
    @score = 0
    @playing = true
    @start_time = Gosu.milliseconds
    @duration   = 15_000
  end

  def draw
    if @visible > 0
      @image.draw(@x - @width / 2, @y - @height / 2, 1)
    end
    @hammer_image.draw(mouse_x - 40, mouse_y - 10, 1)
    if @hit == 0
      c = Gosu::Color::NONE
    elsif @hit == 1
      c = Gosu::Color::GREEN
    elsif @hit == -1
      c = Gosu::Color::RED
    end
    draw_quad(0, 0, c, 800, 0, c, 800, 600, c, 0, 600, c)
    @hit = 0
    @font.draw_text(@score.to_s, 700, 20, 2)
    @font.draw_text(@time_left, 20, 20, 2)
    unless @playing
      text1 = "Game Over"
      if @score <= 0
        text2 = "Not enough hammering on Darmanin :("
      elsif @score == 1
        text2 = "You hammered Darmanin #{@score} time ❤️ !"
      else
        text2 = "You hammered Darmanin #{@score} times ❤️ !"
      end
      x1 = (800 - @font_big.text_width(text1)) / 2
      x2 = (800 - @font.text_width(text2)) / 2
      @font_big.draw_text(text1, x1, 200, 3)
      @font.draw_text(text2, x2, 300, 3)
      @font.draw('Press the Space Bar to Play Again', 190, 400, 3)
      @visible = 20
    end
  end

  def update
    if @playing
      @x += @velocity_x
      @y += @velocity_y
      @visible -= 1
      elapsed = Gosu.milliseconds - @start_time
      remaining_ms = [@duration - elapsed, 0].max
      @time_left = (remaining_ms / 1000).ceil.to_s
      @playing = false if elapsed >= @duration
      @velocity_x *= -1 if @x + @width / 2 > 800 || (@x - @width / 2).negative?
      @velocity_y *= -1 if @y + @height / 2 > 600 || (@y - @height / 2).negative?
      @visible = 50 if @visible < -10 && rand < 0.01
    end
  end

  def button_down(id)
    if @playing
      if id == Gosu::MsLeft
        if Gosu.distance(mouse_x, mouse_y, @x, @y) < 50 && @visible >= 0
          @hit = 1
          @score += 1
        else
          @hit = -1
          @score -= 1
        end
      end
    else
      if id == Gosu::KbSpace
        @playing = true
        @visible = -10
        @score = 0
        @start_time = Gosu.milliseconds
      end
    end
  end
end

window = WhackARuby.new
window.show
