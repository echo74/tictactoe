
-- tictactoe.lua
-- basic tictactoe game using LOVE

--load
function love.load()
    -- initialize board
    board = { {0, 1, 0},
              {0, 2, 0},
              {0, 1, 0}
          }

    love.graphics.setBackgroundColor(0, 0, 0)

    -- load images for board
    blank = love.graphics.newImage("assets/blank.png")
    naught = love.graphics.newImage("assets/naught.png")
    cross = love.graphics.newImage("assets/cross.png")
    -- load images for side panel
    
end


function love.update(dt)

end

--draw
function love.draw()
    drawBoard(board)
    -- drawPanel()

end


-- functions
function drawBoard(board)
    -- loop through each position on the board and
    -- and draw the current positions
    local x_offset = 64
    local y_offset = 64
    local start_x = 100
    local start_y = 100

    for i = 1, #board do
        for j = 1, #board[i] do
            local image = getPiece(board[i][j])
            love.graphics.draw(image, start_x +((j-1)*x_offset), start_y + ((i-1)*y_offset))
        end
    end
end

function drawPanel()
    -- draw the side panel with player indicator and
    -- current scores (wins/losses)
end

function getPiece(number)
    -- convert the number in the board array
    -- into an image
    if number == 0 then
        return blank
    elseif number == 1 then
        return naught
    elseif number == 2 then
        return cross
    end
end
