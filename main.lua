
-- tictactoe.lua
-- basic tictactoe game using LOVE

--load
function love.load()
    -- initialize board
    board = { {0, 1, 0},
              {0, 2, 0},
              {0, 1, 0}
          }
    --Background is black by default
    --love.graphics.setBackgroundColor(0, 0, 0)

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
            love.graphics.draw(image, start_x +(j-1)*x_offset, start_y + (i-1)*y_offset)
            -- draw a rectangle around the image so we can see the collision box
            love.graphics.rectangle( "line", start_x +(j-1)*x_offset, start_y + (i-1)*y_offset, 64, 64 ) -- draw the whole board
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

function collision(mouse,boardsegment)
    if mouse.x>=boardsegment.x and mouse.x<=boardsegment.x+boardsegment.b and mouse.y>=boardsegment.y and mouse.y<=boardsegment.y+boardsegment.h then
        return true
    else
        return false
    end
end
function love.mousepressed( mouse_x, mouse_y, button)
    -- 1=left mouse button
    if button==1 then
        -- loop through our table
        for index,table1 in ipairs(board) do
            for i,v in ipairs(table1) do
                -- if we leftclick and collide with one of the rectangles the set the value to an X
                --                                      filthy hard coding
                if collision({x=mouse_x,y=mouse_y},{x=i*64+100-64,y=index*64+100-64,b=64,h=64}) then
                    --print("colled y="..index.." x="..i)
                    board[index][i]=2
                end
            end
        end
    end
end
