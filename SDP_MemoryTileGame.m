clc
clear
close all

memoryTileGame_scene = simpleGameEngine('MemoryGame.png', 84, 84);

condition = 0;

while condition == 0
    gameOver = 1;
    list = [;];
    random = 0;
    random2 = 0;
    while (gameOver == 1)
    
        if size(list, 1) ~= 0
            % loop so that you dont get the same random tile again
            while (list(end, 1) == random && list(end, 2) == random2)
                random = randi([1, 2], 1);
                random2 = randi([1, 2], 1);
    
                % test if random and if so then add to list
                if (list(end, 1) ~= random || list(end, 2) ~= random2)
                    list(end+1, :) = [random random2;];
                    break
                end
    
            end
        else
            random = randi([1, 2], 1);
            random2 = randi([1, 2], 1);
            list(end+1, :) = [random, random2;];
        end
    
        % Displays full board
        board_display = [2, 3; 4, 5];
        drawScene(memoryTileGame_scene, board_display);
        title("Memory Tile Game");
    
        pause(1.5)
    
        % Displays which tiles the user needs to click in order
        SDP_MemoryTileGameFunction(list, memoryTileGame_scene);
    
        % Displays full board and checks if user clicked the tile
        % shown earlier
        board_display = [2, 3; 4, 5];
        drawScene(memoryTileGame_scene, board_display);
        title("Memory Tile Game");
    
        for i = 1:size(list, 1)
            [r, c] = getMouseInput(memoryTileGame_scene);
            if r ~= list(i, 1) || c ~= list(i, 2)
                gameOver = 0;
                title("Incorrect, Game Over.");
            end
        end

        if gameOver == 0
            condition = input("Type 0 if you want to replay the game and type 1 if you want to stop \n");
        end
    end
end