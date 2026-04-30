extends Node2D

const width = 1920
const height = 1080
const square_size = 120

var colour1 = Color.from_hsv(0.0, 0.0, 0.2, 1)
var colour2 = Color.from_hsv(0.0, 0.0, 0.4, 1)

func _draw():
	var col = 0
	var row = 0

	while row < height / square_size:
		col = 0
		while col < width / square_size:
			var x = col * square_size
			var y = row * square_size
			var color

			if (row + col) % 2 == 0:
				color = colour1
			else:
				color = colour2

			draw_rect(Rect2(x, y, square_size, square_size), color)
			col += 1
		row += 1
