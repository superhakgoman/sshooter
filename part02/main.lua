debug = true;

-- Timers
-- We declare these here so we don't have to edit them multiple places
canShoot = true;
canShootTimerMax = 0.2;
canShootTimer = canShootTimerMax;

-- Image Storage
bulletImg = love.graphics.newImage('assets/aircrafts/bullet_2_blue.png');

-- Entity Storage
bullets = {}; -- array of current bullets being drawn and updated

--called when the game first starts
function love.load(arg)
	player = { x = 100, y = 650, speed = 150, img = nil };
	player.img = love.graphics.newImage('/assets/aircrafts/Aircraft_01.png');
end


--called on every frame - deltaTime needed
function love.update(dt)
	if love.keyboard.isDown('escape') then
		love.event.push('quit')
	end

	if love.keyboard.isDown('left','a') then
if player.x > 0 then -- binds us to the map
	player.x = player.x - (player.speed*dt)
end
elseif love.keyboard.isDown('right','d') then
	if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
		player.x = player.x + (player.speed*dt)
	end
end


-- Time out how far apart our shots can be.
canShootTimer = canShootTimer - (1 * dt)
if canShootTimer < 0 then
	canShoot = true
end

if love.keyboard.isDown(' ', 'rctrl', 'lctrl', 'ctrl', 'space', 'spacebar') and canShoot then
-- Create some bullets
newBullet = { x = player.x + (player.img:getWidth()/2), y = player.y, img = bulletImg }
table.insert(bullets, newBullet)
canShoot = false
canShootTimer = canShootTimerMax
end

-- update the positions of bullets
for i, bullet in ipairs(bullets) do
	bullet.y = bullet.y - (250 * dt)

if bullet.y < 0 then -- remove bullets when they pass off the screen
	table.remove(bullets, i)
end
end



end

function love.draw(dt)
	love.graphics.draw(player.img, player.x, player.y);

	for i, bullet in ipairs(bullets) do
		love.graphics.draw(bullet.img, bullet.x, bullet.y)
	end

end
