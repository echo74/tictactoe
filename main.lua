-- main.lua
-- basic tictactoe game using LOVE


--load
function love.load()
    board = { 1, 0, 1, 1, 0, 1, 1, 1, 1 }

    love.graphics.setBackgroundColor(255, 255, 255)
    blank = love.graphics.newImage("assets/blank.png")
    naught = love.graphics.newImage("assets/naught.png")

end


--update
function love.update(dt)

end

--draw
function love.draw()
    drawBoard(board)

end


-- functions
function drawBoard(board)
    -- loop through each position on the board
    local x_offset = 0
    local y_offset = 0

    for k, v in pairs(board) do
        -- determine correct image for the player piece
        love.graphics.draw(getPiece(board[v]), 100+x_offset, 50+y_offset)
        x_offset = x_offset + 150
        if x_offset > 450 then

    end
end

function getPiece(number)
    if number == 0 then
        return blank
    elseif number == 1 then
        return naught
    else
        return blank
    end
end
