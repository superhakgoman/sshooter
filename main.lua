debug = true;

--called when the game first starts
function love.load(arg)
  playerImg = love.graphics.newImage('assets/aircrafts/Aircraft_01.png');
end

--called on every frame - deltaTime needed
function love.update(dt)

end

function love.draw(dt)
	love.graphics.draw(playerImg, 100, 100);
end
