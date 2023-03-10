class WhackARuby < Gosu::Window

  def initialize
    super 800, 600, false
    self.caption = 'Kiss your Jéjé!'
    @image = Gosu::Image.new('jeje.png', tileable: false)
    @x = 200
    @y = 200
    @width = 50
    @height = 43
    @velocity_x = 3
    @velocity_y = 3
    @visible = 0
    @hammer_image = Gosu::Image.new('kiss.png', tileable: false)
    @hit = 0
    @font = Gosu::Font.new(30)
    @font_big = Gosu::Font.new(60)
    @score = 0
    @playing = true
    @start_time = 0
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
      @font_big.draw('Game Over', 260, 200, 3)
      @font.draw("You kissed your Jéjé #{@score} times ❤️ !", 200, 300, 3)
      @font.draw('Press the Space Bar to Play Again', 190, 400, 3)
      @visible = 20
    end
  end

  def update
    if @playing
      @x += @velocity_x
      @y += @velocity_y
      @visible -= 1
      @time_left = (30 - (Gosu.milliseconds / 1000)).to_s
      @playing = false if Gosu.milliseconds > 30_000
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
          @score += 5
        else
          @hit = -1
          @score -= 1
        end
      elsif id == Gosu::KbSpace
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
