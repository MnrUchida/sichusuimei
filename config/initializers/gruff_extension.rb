class Gruff::Spider
  attr_accessor :base_angle

  def draw_axes(center_x, center_y, radius, additive_angle, line_color = nil)
    return if hide_axes

    current_angle = -Math::PI / 2 + base_angle

    @data.each do |data_row|
      @d.stroke(line_color || data_row[DATA_COLOR_INDEX])
      @d.stroke_width 5.0

      x_offset = radius * Math.cos(current_angle)
      y_offset = radius * Math.sin(current_angle)

      @d.line(center_x, center_y,
              center_x + x_offset,
              center_y + y_offset)

      draw_label(center_x, center_y, current_angle, radius - 40, data_row[DATA_LABEL_INDEX].to_s) unless hide_text

      current_angle += additive_angle
    end
  end

  def draw_polygon(center_x, center_y, additive_angle, color = nil)
    points = []
    current_angle = -Math::PI / 2 + base_angle
    @data.each do |data_row|
      points << center_x + normalize_points(data_row[DATA_VALUES_INDEX].first) * Math.cos(current_angle)
      points << center_y + normalize_points(data_row[DATA_VALUES_INDEX].first) * Math.sin(current_angle)
      current_angle += additive_angle
    end

    @d.stroke_width 1.0
    @d.stroke(color || @marker_color)
    @d.fill(color || @marker_color)
    @d.fill_opacity 0.4
    @d.polygon(*points)
  end

end