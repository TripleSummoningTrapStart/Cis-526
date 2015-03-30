class GpsController < ApplicationController
def draw
	image = ChunkyPNG::Image.from_file('easyLab1.png')
	image = image.line(1, 1, 100, 100, ChunkyPNG::Color.from_hex('#aa007f'))
	image.save('easyLab1.png')
end

helper_method :draw
#make a helper method to allow view to call controller methods
end
