class GpsController < ApplicationController
def index
@image = ChunkyPNG::Image.from_file('easyLab1.png')
end
#make a helper method to allow view to call controller methods
end
